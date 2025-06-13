import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_brief.freezed.dart';
part 'account_brief.g.dart';

@freezed
abstract class AccountBrief with _$AccountBrief {
  const AccountBrief._();

  const factory AccountBrief({
    required int id,
    required String name,
    required String balance,
    required String currency,
  }) = _AccountBrief;

  factory AccountBrief.fromJson(Map<String, dynamic> json) => _$AccountBriefFromJson(json);
}
