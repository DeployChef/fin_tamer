import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/core/network/dio_client.dart';
import 'package:fin_tamer/core/network/api_service.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/remote/history_api_remote_data_source.dart';
import 'package:fin_tamer/features/history/data/remote/interfaces/i_history_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';

part 'network_providers.g.dart';

@riverpod
DioClient dioClient(Ref ref) {
  return DioClient();
}

@riverpod
ApiService apiService(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);
  return ApiService(dioClient);
}

@riverpod
IAccountRemoteDataSource accountApiRemoteDataSource(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return RemoteAccountDataSource(apiService);
}

@riverpod
ICategoryRemoteDataSource categoryApiRemoteDataSource(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CategoryRemoteDataSource(apiService);
}

@riverpod
IHistoryRemoteDataSource historyApiRemoteDataSource(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return HistoryApiRemoteDataSource(apiService);
}

@riverpod
ITransactionRemoteDataSource transactionApiRemoteDataSource(Ref ref) {
  final apiService = ref.watch(apiServiceProvider);
  return TransactionRemoteDataSource(apiService);
}
