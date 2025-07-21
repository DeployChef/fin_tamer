import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fin_tamer/features/account/data/account_repository.dart';
import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/features/account/domain/models/account_create_data.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';
import 'package:fin_tamer/features/account/data/local/stat_item_local_data_source.dart';
import 'package:fin_tamer/core/event_sourcing/sync_service.dart';
import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:fin_tamer/features/account/data/local/entities/stat_item_entity.dart';
import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_response_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/stat_item_dto.dart';
import 'package:fin_tamer/features/account/data/remote/dto/account_create_request_dto.dart';
import 'package:fin_tamer/core/event_sourcing/sync_event.dart';

class MockAccountRemoteDataSource extends Mock implements IAccountRemoteDataSource {}

class MockAccountLocalDataSource extends Mock implements IAccountLocalDataSource {}

class MockStatItemLocalDataSource extends Mock implements IStatItemLocalDataSource {}

class MockSyncService extends Mock implements ISyncService {}

void main() {
  setUpAll(() {
    registerFallbackValue(AccountCreateRequestDto(name: '', balance: '', currency: ''));
    registerFallbackValue(AccountEntity(
      id: 0,
      apiId: 0,
      name: '',
      balance: '',
      currency: '',
      createdAt: DateTime(2000),
      updatedAt: DateTime(2000),
    ));
    registerFallbackValue(SyncEvent(
      entityTypeIndex: 0,
      eventTypeIndex: 0,
      entityId: '',
      payloadJson: '',
      timestamp: DateTime(2000),
    ));
  });
  late MockAccountRemoteDataSource remote;
  late MockAccountLocalDataSource local;
  late MockStatItemLocalDataSource statItemLocal;
  late MockSyncService syncService;
  late AccountRepository repository;

  final now = DateTime(2023, 1, 1);
  final accountEntity = AccountEntity(
    id: 1,
    apiId: 10,
    name: 'Test Account',
    balance: '100.00',
    currency: 'USD',
    createdAt: DateTime(2022, 1, 1),
    updatedAt: DateTime(2022, 1, 2),
  );
  final incomeStatEntity = StatItemEntity(
    id: 1,
    apiId: 100,
    accountApiId: 10,
    isIncome: true,
    categoryId: 1,
    categoryName: 'Salary',
    emoji: '💰',
    amount: '100.00',
  );
  final expenseStatEntity = StatItemEntity(
    id: 2,
    apiId: 101,
    accountApiId: 10,
    isIncome: false,
    categoryId: 2,
    categoryName: 'Food',
    emoji: '🍔',
    amount: '50.00',
  );
  final accountDto = AccountDto(
    id: 10,
    userId: 1,
    name: 'Test Account',
    balance: '100.00',
    currency: 'USD',
    createdAt: DateTime(2022, 1, 1),
    updatedAt: DateTime(2022, 1, 2),
  );

  setUp(() {
    remote = MockAccountRemoteDataSource();
    local = MockAccountLocalDataSource();
    statItemLocal = MockStatItemLocalDataSource();
    syncService = MockSyncService();
    repository = AccountRepository(
      remoteDataSource: remote,
      localDataSource: local,
      statItemLocalDataSource: statItemLocal,
      syncService: syncService,
    );
  });

  group('AccountRepository', () {
    test('returns local accounts with stats if local data is not empty', () async {
      when(() => local.getAll()).thenAnswer((_) async => [accountEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => [incomeStatEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => [expenseStatEntity]);

      final result = await repository.getAll();

      expect(result, hasLength(1));
      final acc = result.first;
      expect(acc.id, accountEntity.id);
      expect(acc.apiId, accountEntity.apiId);
      expect(acc.name, accountEntity.name);
      expect(acc.balance, accountEntity.balance);
      expect(acc.currency, accountEntity.currency);
      expect(acc.incomeStats, isNotEmpty);
      expect(acc.expenseStats, isNotEmpty);
      expect(acc.incomeStats.first.categoryName, 'Salary');
      expect(acc.expenseStats.first.categoryName, 'Food');
    });

    test('fetches from remote and saves to local if local is empty', () async {
      when(() => local.getAll()).thenAnswer((_) async => []);
      when(() => remote.getAll()).thenAnswer((_) async => [accountDto]);
      when(() => local.saveAll(any())).thenAnswer((_) async {});

      final result = await repository.getAll();

      expect(result, hasLength(1));
      final acc = result.first;
      expect(acc.apiId, accountDto.id);
      verify(() => local.saveAll(any())).called(1);
    });

    test('getById returns account with stats if found locally', () async {
      when(() => local.getById(1)).thenAnswer((_) async => accountEntity);
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => [incomeStatEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => [expenseStatEntity]);

      final result = await repository.getById(1);

      expect(result, isNotNull);
      expect(result!.id, accountEntity.id);
      expect(result.incomeStats.first.categoryName, 'Salary');
      expect(result.expenseStats.first.categoryName, 'Food');
    });

    test('getById fetches from remote if stats are missing locally', () async {
      when(() => local.getById(1)).thenAnswer((_) async => accountEntity);
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => []);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => []);
      final remoteStats = AccountResponseDto(
        id: 10,
        name: 'Test Account',
        balance: '100.00',
        currency: 'USD',
        incomeStats: [StatItemDto(categoryId: 1, categoryName: 'Salary', emoji: '💰', amount: '100.00')],
        expenseStats: [StatItemDto(categoryId: 2, categoryName: 'Food', emoji: '🍔', amount: '50.00')],
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
      );
      when(() => remote.getResponseById(10)).thenAnswer((_) async => remoteStats);
      when(() => statItemLocal.saveAll(any())).thenAnswer((_) async {});

      final result = await repository.getById(1);

      expect(result, isNotNull);
      expect(result!.incomeStats.first.categoryName, 'Salary');
      expect(result.expenseStats.first.categoryName, 'Food');
      verify(() => statItemLocal.saveAll(any())).called(1);
    });

    test('getById returns null if not found anywhere', () async {
      when(() => local.getById(1)).thenAnswer((_) async => null);
      when(() => local.getAll()).thenAnswer((_) async => []);
      when(() => remote.getAll()).thenAnswer((_) async => []);
      when(() => local.saveAll(any())).thenAnswer((_) async {});

      final result = await repository.getById(1);
      expect(result, isNull);
    });

    test('create saves new account and returns it with stats', () async {
      final createData = AccountCreateData(name: 'Test Account', balance: '100.00', currency: 'USD');
      when(() => remote.create(any())).thenAnswer((_) async => accountDto);
      when(() => local.save(any())).thenAnswer((_) async {});
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => [incomeStatEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => [expenseStatEntity]);

      final result = await repository.create(createData);

      expect(result.apiId, accountDto.id);
      expect(result.incomeStats.first.categoryName, 'Salary');
      expect(result.expenseStats.first.categoryName, 'Food');
      verify(() => local.save(any())).called(1);
    });

    test('update updates local entity, adds sync event, and returns updated account', () async {
      final updateData = AccountUpdateData(id: 1, name: 'Updated', balance: '200.00', currency: 'USD');
      final updatedEntity = AccountEntity(
        id: 1,
        apiId: 10,
        name: 'Updated',
        balance: '200.00',
        currency: 'USD',
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
      );
      when(() => local.getById(1)).thenAnswer((_) async => AccountEntity(
            id: 1,
            apiId: 10,
            name: 'Test Account',
            balance: '100.00',
            currency: 'USD',
            createdAt: DateTime(2022, 1, 1),
            updatedAt: DateTime(2022, 1, 2),
          ));
      when(() => local.save(any())).thenAnswer((_) async {});
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => [incomeStatEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => [expenseStatEntity]);
      when(() => syncService.addEvent(any())).thenReturn(null);

      final result = await repository.update(updateData);

      expect(result, isNotNull);
      expect(result!.name, 'Updated');
      expect(result.balance, '200.00');
      verify(() => local.save(any())).called(1);
      verify(() => syncService.addEvent(any())).called(1);
    });

    test('update throws if account not found locally', () async {
      final updateData = AccountUpdateData(id: 999, name: 'Nope', balance: '0', currency: 'USD');
      when(() => local.getById(999)).thenAnswer((_) async => null);
      expect(() => repository.update(updateData), throwsException);
    });

    test('getByApiId returns account with stats if found locally', () async {
      when(() => local.getByApiId(10)).thenAnswer((_) async => accountEntity);
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => [incomeStatEntity]);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => [expenseStatEntity]);

      final result = await repository.getByApiId(10);

      expect(result, isNotNull);
      expect(result!.apiId, 10);
      expect(result.incomeStats.first.categoryName, 'Salary');
      expect(result.expenseStats.first.categoryName, 'Food');
    });

    test('getByApiId fetches stats from remote if missing locally', () async {
      when(() => local.getByApiId(10)).thenAnswer((_) async => accountEntity);
      when(() => statItemLocal.getByAccount(10, isIncome: true)).thenAnswer((_) async => []);
      when(() => statItemLocal.getByAccount(10, isIncome: false)).thenAnswer((_) async => []);
      final remoteStats = AccountResponseDto(
        id: 10,
        name: 'Test Account',
        balance: '100.00',
        currency: 'USD',
        incomeStats: [StatItemDto(categoryId: 1, categoryName: 'Salary', emoji: '💰', amount: '100.00')],
        expenseStats: [StatItemDto(categoryId: 2, categoryName: 'Food', emoji: '🍔', amount: '50.00')],
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
      );
      when(() => remote.getResponseById(10)).thenAnswer((_) async => remoteStats);
      when(() => statItemLocal.saveAll(any())).thenAnswer((_) async {});

      final result = await repository.getByApiId(10);

      expect(result, isNotNull);
      expect(result!.incomeStats.first.categoryName, 'Salary');
      expect(result.expenseStats.first.categoryName, 'Food');
      verify(() => statItemLocal.saveAll(any())).called(1);
    });

    test('getByApiId returns null if not found', () async {
      when(() => local.getByApiId(999)).thenAnswer((_) async => null);
      final result = await repository.getByApiId(999);
      expect(result, isNull);
    });

    test('updateLocalBalance updates balance and saves entity', () async {
      final entity = AccountEntity(
        id: 1,
        apiId: 10,
        name: 'Test Account',
        balance: '100.00',
        currency: 'USD',
        createdAt: DateTime(2022, 1, 1),
        updatedAt: DateTime(2022, 1, 2),
      );
      when(() => local.getById(1)).thenAnswer((_) async => entity);
      when(() => local.save(any())).thenAnswer((_) async {});

      await repository.updateLocalBalance(1, 123.45);
      verify(() => local.save(any())).called(1);
    });

    test('updateLocalBalance does nothing if account not found', () async {
      when(() => local.getById(999)).thenAnswer((_) async => null);
      await repository.updateLocalBalance(999, 123.45);
      verifyNever(() => local.save(any()));
    });
  });
}
