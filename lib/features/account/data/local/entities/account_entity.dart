import 'package:objectbox/objectbox.dart';

@Entity()
class AccountEntity {
  @Id()
  int id;
  int apiId;
  String name;
  String balance;
  String currency;
  DateTime createdAt;
  DateTime updatedAt;

  AccountEntity({
    this.id = 0,
    required this.apiId,
    required this.name,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });
}
