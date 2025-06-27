import 'package:freezed_annotation/freezed_annotation.dart';
import 'stat_item.dart';
import 'account_brief.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const Account._();
  const factory Account({
    required int id,
    required String name,
    required String balance,
    required String currency,
    @Default([]) List<StatItem> incomeStats,
    @Default([]) List<StatItem> expenseStats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

extension AccountToBrief on Account {
  AccountBrief toBrief() => AccountBrief(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}
