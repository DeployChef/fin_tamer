import 'package:path_provider/path_provider.dart';
import 'package:fin_tamer/objectbox.g.dart';

Future<Store> createObjectBoxStore() async {
  final dir = await getApplicationDocumentsDirectory();
  return openStore(directory: '${dir.path}/objectbox');
}
