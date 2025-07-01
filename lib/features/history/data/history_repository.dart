import 'package:fin_tamer/features/history/domain/interfaces/i_history_repository.dart';
import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';
import 'package:fin_tamer/features/history/data/remote/history_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/local/history_local_data_source.dart';
import 'package:fin_tamer/features/history/data/local/mappers/history_local_mapper.dart';
import 'package:fin_tamer/features/account/data/local/account_local_data_source.dart';

class HistoryRepository implements IHistoryRepository {
  final HistoryRemoteDataSource remoteDataSource;
  final HistoryLocalDataSource localDataSource;
  final AccountLocalDataSource accountLocalDataSource;

  HistoryRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.accountLocalDataSource,
  });

  @override
  Future<AccountHistoryFeed?> getAccountById(int id) async {
    final localEntities = await localDataSource.getAll();
    final local = localEntities.where((e) => e.accountId == id).toList();
    if (local.isNotEmpty) {
      final history = local.map((e) => e.toDomain()).toList();
      final lastState = history.last.newState;
      return AccountHistoryFeed(
        accountId: id,
        accountName: lastState.name,
        currency: lastState.currency,
        currentBalance: lastState.balance,
        history: history,
      );
    }

    final accountEntity = await accountLocalDataSource.getById(id);
    if (accountEntity == null) return null;

    final dto = await remoteDataSource.getAccountById(accountEntity.apiId);
    if (dto == null) return null;

    final entities = dto.history.map((e) => e.toEntity()).toList();
    await localDataSource.saveAll(entities);

    return AccountHistoryFeed(
      accountId: dto.accountId,
      accountName: dto.accountName,
      currency: dto.currency,
      currentBalance: dto.currentBalance,
      history: entities.map((e) => e.toDomain()).toList(),
    );
  }
}
