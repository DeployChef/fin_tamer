import 'package:fin_tamer/features/account/data/mock_account_repository.dart';
import 'package:fin_tamer/features/account/domain/interfaces/i_account_repository.dart';
import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
class AccountService extends _$AccountService {
  static final IAccountRepository accountRepo = MockAccountRepository();

  @override
  FutureOr<Account?> build() async {
    final accounts = await accountRepo.getAll();

    if (accounts.isEmpty) return null;

    return accounts.first;
  }
}
