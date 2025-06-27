import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
class AccountService extends _$AccountService {
  @override
  FutureOr<Account?> build() async {
    final repo = await ref.watch(accountRepositoryProvider.future);
    final accounts = await repo.getAll();

    if (accounts.isEmpty) return null;

    return accounts.first;
  }

  Future<void> updateAccount({required String name}) async {
    final account = state.value;
    if (account != null) {
      final repo = await ref.read(accountRepositoryProvider.future);
      await repo.updateAccountName(account.id, name);
      state = AsyncData(account.copyWith(name: name));
    }
  }
}
