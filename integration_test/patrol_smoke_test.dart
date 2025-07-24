import 'package:patrol/patrol.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_tamer/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:worker_manager/worker_manager.dart';

void main() {
  patrolTest('smoke', ($) async {
    await dotenv.load();
    print("env Load");
    await workerManager.init();
    print("worker load");
    await $.pumpWidgetAndSettle(
      ProviderScope(child: MainApp()),
    );
    // Проверяем, что приложение вообще стартует
    // Можно искать любой текст, который точно есть на главном экране
    // await $("app").waitUntilVisible();
  });
}
