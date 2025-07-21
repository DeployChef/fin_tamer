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
      // TODO: implement
    });

    test('fetches from remote and saves to local if local is empty', () async {
      // TODO: implement
    });

    test('getById returns account with stats if found locally', () async {
      // TODO: implement
    });

    test('getById fetches from remote if stats are missing locally', () async {
      // TODO: implement
    });

    test('getById returns null if not found anywhere', () async {
      // TODO: implement
    });

    test('create saves new account and returns it with stats', () async {
      // TODO: implement
    });

    test('update updates local entity, adds sync event, and returns updated account', () async {
      // TODO: implement
    });

    test('update throws if account not found locally', () async {
      // TODO: implement
    });

    test('getByApiId returns account with stats if found locally', () async {
      // TODO: implement
    });

    test('getByApiId fetches stats from remote if missing locally', () async {
      // TODO: implement
    });

    test('getByApiId returns null if not found', () async {
      // TODO: implement
    });

    test('updateLocalBalance updates balance and saves entity', () async {
      // TODO: implement
    });

    test('updateLocalBalance does nothing if account not found', () async {
      // TODO: implement
    });
  });
}
