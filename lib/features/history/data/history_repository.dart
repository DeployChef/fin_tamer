import 'package:fin_tamer/features/history/domain/interfaces/i_history_repository.dart';
import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';
import 'package:fin_tamer/features/history/data/remote/history_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/remote/mappers/history_mapper.dart';
import 'package:fin_tamer/features/history/data/local/history_local_data_source.dart';
import 'package:fin_tamer/features/history/data/local/mappers/history_local_mapper.dart';

class HistoryRepository implements IHistoryRepository {
  final HistoryRemoteDataSource remoteDataSource;
  final HistoryLocalDataSource localDataSource;

  HistoryRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<AccountHistoryFeed?> getAccountById(int id) async {
    final localEntities = await localDataSource.getAll();
    final local = localEntities.where((e) => e.accountId == id).toList();
    if (local.isNotEmpty) {
      // final history = local.map((e) => e.toDomain()).toList();
      // // TODO Задел на будущее - здесь можно собрать AccountHistoryFeed, если есть нужные данные
      // // (например, accountName, currency и т.д. — если они есть в Entity или отдельной таблице)
      // // Пока возвращаем null, если не хватает данных
      return null;
    }
    final dto = await remoteDataSource.getAccountById(id);
    if (dto == null) return null;
    await localDataSource.saveAll(dto.history.map((e) => e.toEntity()).toList());
    return dto.toDomain();
  }
}
