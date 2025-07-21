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

class MockAccountRemoteDataSource extends Mock implements IAccountRemoteDataSource {}

class MockAccountLocalDataSource extends Mock implements IAccountLocalDataSource {}

class MockStatItemLocalDataSource extends Mock implements IStatItemLocalDataSource {}

class MockSyncService extends Mock implements ISyncService {}

void main() {
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

    // Остальные тесты будут реализованы далее
    test('getById returns account with stats if found locally', () async {});
    test('getById fetches from remote if stats are missing locally', () async {});
    test('getById returns null if not found anywhere', () async {});
    test('create saves new account and returns it with stats', () async {});
    test('update updates local entity, adds sync event, and returns updated account', () async {});
    test('update throws if account not found locally', () async {});
    test('getByApiId returns account with stats if found locally', () async {});
    test('getByApiId fetches stats from remote if missing locally', () async {});
    test('getByApiId returns null if not found', () async {});
    test('updateLocalBalance updates balance and saves entity', () async {});
    test('updateLocalBalance does nothing if account not found', () async {});
  });
}
