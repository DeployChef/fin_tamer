import 'package:objectbox/objectbox.dart';

@Entity()
class StatItemEntity {
  @Id()
  int id;
  int apiId;
  int accountApiId;
  bool isIncome; // true - доход, false - расход
  int categoryId;
  String categoryName;
  String emoji;
  String amount; // Строка, как приходит с API

  StatItemEntity({
    this.id = 0,
    required this.apiId,
    required this.accountApiId,
    required this.isIncome,
    required this.categoryId,
    required this.categoryName,
    required this.emoji,
    required this.amount,
  });
}
