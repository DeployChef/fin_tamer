import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_update_data.freezed.dart';

@freezed
abstract class AccountUpdateData with _$AccountUpdateData {
  const factory AccountUpdateData({
    required int id,
    required String name,
    required String balance,
    required String currency,
  }) = _AccountUpdateData;
}
