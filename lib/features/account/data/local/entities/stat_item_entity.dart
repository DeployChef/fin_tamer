import 'package:fin_tamer/features/account/data/local/entities/account_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class StatItemEntity {
  @Id()
  int id;

  int categoryId;
  String categoryName;
  String emoji;
  String amount;

  final account = ToOne<AccountEntity>();

  StatItemEntity({
    this.id = 0,
    required this.categoryId,
    required this.categoryName,
    required this.emoji,
    required this.amount,
  });
}
