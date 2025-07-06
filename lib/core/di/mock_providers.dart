import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fin_tamer/features/account/data/remote/i_account_remote_data_source.dart';
import 'package:fin_tamer/features/account/data/remote/mock_account_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/i_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/transaction/data/remote/mock_transaction_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/mock_category_remote_data_source.dart';
import 'package:fin_tamer/features/category/data/remote/interfaces/i_category_remote_data_source.dart';

part 'mock_providers.g.dart';

@riverpod
IAccountRemoteDataSource accountMockRemoteDataSource(Ref ref) {
  return MockRemoteAccountDataSource();
}

@riverpod
ITransactionRemoteDataSource transactionMockRemoteDataSource(Ref ref) {
  final accountRemote = ref.watch(accountMockRemoteDataSourceProvider);
  final categoryRemote = ref.watch(categoryMockRemoteDataSourceProvider);
  return MockTransactionRemoteDataSource(accountRemote, categoryRemote);
}

@riverpod
ICategoryRemoteDataSource categoryMockRemoteDataSource(Ref ref) {
  return MockCategoryRemoteDataSource();
}
