import 'package:objectbox/objectbox.dart';
import 'package:fin_tamer/objectbox.g.dart';

@Entity()
class TransactionEntity {
  @Id()
  int id;
  int apiId;
  int accountApiId;
  int categoryApiId;
  String amount;
  DateTime transactionDate;
  String? comment;
  DateTime createdAt;
  DateTime updatedAt;

  TransactionEntity({
    this.id = 0,
    required this.apiId,
    required this.accountApiId,
    required this.categoryApiId,
    required this.amount,
    required this.transactionDate,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
  });
}
