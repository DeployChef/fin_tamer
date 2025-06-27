import 'package:objectbox/objectbox.dart';

@Entity()
class HistoryEntity {
  @Id()
  int id;
  int apiId;
  int accountId;
  String changeType;
  String previousStateJson;
  String newStateJson;
  DateTime changeTimestamp;
  DateTime createdAt;

  HistoryEntity({
    this.id = 0,
    required this.apiId,
    required this.accountId,
    required this.changeType,
    required this.previousStateJson,
    required this.newStateJson,
    required this.changeTimestamp,
    required this.createdAt,
  });
}
