import 'package:patrol/patrol.dart';
import 'package:fin_tamer/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fin_tamer/core/di/repository_providers.dart'; // если нужны overrides
// import 'mocks/mock_account_repository.dart'; // если нужны моки

void main() {
  patrolTest('Редактирование аккаунта', ($) async {
    // Если нужно подменить провайдеры, раскомментируйте и добавьте свои моки
    await $.pumpWidgetAndSettle(
      ProviderScope(
        // overrides: [accountRepositoryProvider.overrideWithValue(MockAccountRepository())],
        child: MainApp(),
      ),
    );

    // 1. Открыть экран аккаунта (если не стартовый)
    // await $(#open_account_page_button).tap();

    // 2. Нажать "Редактировать"
    await $(#edit_account_button).tap();

    // 3. Ввести новое имя
    await $(#account_name_field).enterText('Новое имя');

    // 4. Сохранить
    await $(#save_button).tap();

    // 5. Проверить, что имя изменилось
    await $("Новое имя").waitUntilVisible();

    // 6. (Опционально) Проверить side-effect, например, snackbar
    // await $("Аккаунт обновлён").waitUntilVisible();
  });
}
