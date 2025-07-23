import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:fin_tamer/features/currency/ui/currency_tile.dart';
import 'package:fin_tamer/features/currency/domain/models/currency.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testGoldens('CurrencyTile golden test', (WidgetTester tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'Ruble',
        const ProviderScope(child: CurrencyTile(currency: Currency.ruble)),
      )
      ..addScenario(
        'US Dollar',
        const ProviderScope(child: CurrencyTile(currency: Currency.usDollar)),
      )
      ..addScenario(
        'Euro',
        const ProviderScope(child: CurrencyTile(currency: Currency.euro)),
      );

    await tester.pumpWidgetBuilder(
      builder.build(),
    );
    await screenMatchesGolden(tester, 'currency_tile_golden');
  });
}
