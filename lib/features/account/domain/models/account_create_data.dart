import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_create_data.freezed.dart';

@freezed
abstract class AccountCreateData with _$AccountCreateData {
  const factory AccountCreateData({
    required String name,
    required String balance,
    required String currency,
  }) = _AccountCreateData;
}
