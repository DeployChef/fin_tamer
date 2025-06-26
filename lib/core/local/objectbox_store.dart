import 'package:path_provider/path_provider.dart';

import 'package:fin_tamer/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: '${dir.path}/objectbox');
    return ObjectBox._create(store);
  }
}
