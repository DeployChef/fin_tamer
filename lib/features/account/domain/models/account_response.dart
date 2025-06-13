import 'package:fin_tamer/features/account/domain/models/stat_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_response.freezed.dart';
part 'account_response.g.dart';

@freezed
abstract class AccountResponse with _$AccountResponse {
  const AccountResponse._();

  const factory AccountResponse({
    required int id,
    required String name,
    required String balance,
    required String currency,
    required List<StatItem> incomeStats,
    required List<StatItem> expenseStats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(Map<String, dynamic> json) => _$AccountResponseFromJson(json);
}
