import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryEntity {
  @Id()
  int id;
  int apiId;
  String name;
  String emoji;
  bool isIncome;

  CategoryEntity({
    this.id = 0,
    required this.apiId,
    required this.name,
    required this.emoji,
    required this.isIncome,
  });
}
