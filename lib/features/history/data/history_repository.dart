import 'package:fin_tamer/features/history/domain/interfaces/i_history_repository.dart';
import 'package:fin_tamer/features/history/domain/models/account_history_feed.dart';
import 'remote/history_remote_data_source.dart';
import 'remote/mappers/history_mapper.dart';
// import 'remote/mappers/history_mapper.dart'; // Добавим после создания мапперов

class HistoryRepository implements IHistoryRepository {
  final HistoryRemoteDataSource remoteDataSource;

  HistoryRepository(this.remoteDataSource);

  @override
  Future<AccountHistoryFeed?> getAccountById(int id) async {
    final dto = await remoteDataSource.getAccountById(id);
    return dto?.toDomain();
  }
}
