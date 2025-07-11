import 'package:objectbox/objectbox.dart';
import 'sync_event.dart';

class SyncEventDataSource {
  final Box<SyncEvent> _box;

  SyncEventDataSource(this._box);

  int addEvent(SyncEvent event) => _box.put(event);

  List<SyncEvent> getAllEvents() =>
      _box.getAll()..sort((a, b) => a.timestamp.compareTo(b.timestamp));

  void deleteEvent(int id) => _box.remove(id);

  void clearAllEvents() => _box.removeAll();
}
