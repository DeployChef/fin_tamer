import 'package:fin_tamer/features/account/domain/services/account_service.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'currency_service.g.dart';

@Riverpod(keepAlive: true, dependencies: [AccountService])
class CurrencyService extends _$CurrencyService {
  @override
  FutureOr<Currency> build() async {
    final account = await ref.watch(accountServiceProvider.future);

    if (account == null) return Currency.ruble;

    return Currency.fromCode(account.currency);
  }

  Future<void> setCurrency(Currency currency) async {
    final account = ref.read(accountServiceProvider.notifier);
    await account.updateCurrency(currency: currency);
    state = AsyncData(currency);
  }
}
