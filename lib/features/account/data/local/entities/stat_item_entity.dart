import 'package:objectbox/objectbox.dart';

@Entity()
class StatItemEntity {
  @Id()
  int id;
  int apiId;
  int accountApiId;
  bool isIncome; // true - доход, false - расход
  String name;
  String value;

  StatItemEntity({
    this.id = 0,
    required this.apiId,
    required this.accountApiId,
    required this.isIncome,
    required this.name,
    required this.value,
  });
}
