import 'package:fin_tamer/features/account/domain/models/account.dart';
import 'package:fin_tamer/core/di/repository_providers.dart';
import 'package:fin_tamer/features/account/domain/models/account_update_data.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
class AccountService extends _$AccountService {
  @override
  FutureOr<Account?> build() async {
    final repo = await ref.watch(accountRepositoryProvider.future);
    final accounts = await repo.getAll();

    if (accounts.isEmpty) return null;

    final fullAcc = await repo.getById(accounts.first.id);

    return fullAcc;
  }

  Future<void> updateAccount({required String name}) async {
    final account = state.value;
    if (account != null) {
      final repo = await ref.read(accountRepositoryProvider.future);

      final updateRequest = AccountUpdateData(
        id: account.id,
        name: name,
        balance: account.balance,
        currency: account.currency,
      );
      await repo.update(updateRequest);
      state = AsyncData(account.copyWith(name: name));
    }
  }

  Future<void> updateCurrency({required Currency currency}) async {
    final account = state.value;
    if (account != null) {
      final repo = await ref.read(accountRepositoryProvider.future);

      final updateRequest = AccountUpdateData(
        id: account.id,
        name: account.name,
        balance: account.balance,
        currency: currency.code,
      );

      await repo.update(updateRequest);
      state = AsyncData(account.copyWith(currency: currency.code));
    }
  }
}
