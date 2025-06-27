import 'package:fin_tamer/features/account/data/account_repository.dart';
import 'package:fin_tamer/features/account/data/remote/account_remote_data_source.dart';
import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
class AccountService extends _$AccountService {
  static final IAccountRepository accountRepo = AccountRepository(MockRemoteAccountDataSource());

  @override
  FutureOr<Account?> build() async {
    final accounts = await accountRepo.getAll();

    if (accounts.isEmpty) return null;

    return accounts.first;
  }

  Future<void> updateAccount({required String name}) async {
    final account = state.value;
    if (account != null) {
      state = AsyncData(account.copyWith(name: name));
    }
  }
}
