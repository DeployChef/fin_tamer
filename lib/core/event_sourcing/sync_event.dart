import 'package:objectbox/objectbox.dart';

enum EntityType { transaction, account }

enum EventType { create, update, delete }

@Entity()
class SyncEvent {
  @Id()
  int id;

  int entityTypeIndex;
  int eventTypeIndex;
  String entityId;
  String payloadJson;
  DateTime timestamp;

  SyncEvent({
    this.id = 0,
    required this.entityTypeIndex,
    required this.eventTypeIndex,
    required this.entityId,
    required this.payloadJson,
    required this.timestamp,
  });

  EntityType get entityType => EntityType.values[entityTypeIndex];
  EventType get eventType => EventType.values[eventTypeIndex];
}
