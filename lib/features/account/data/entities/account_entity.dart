import 'package:objectbox/objectbox.dart';
import 'stat_item_entity.dart';

@Entity()
class AccountEntity {
  @Id()
  int id;

  int userId;
  String name;
  String balance;
  String currency;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  @Backlink('account')
  final incomeStats = ToMany<StatItemEntity>();

  @Backlink('account')
  final expenseStats = ToMany<StatItemEntity>();

  AccountEntity({
    this.id = 0,
    required this.userId,
    required this.name,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });
}
