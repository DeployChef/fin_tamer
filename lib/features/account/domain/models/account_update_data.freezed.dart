// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_update_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountUpdateData {
  int get id;
  String get name;
  String get balance;
  String get currency;

  /// Create a copy of AccountUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountUpdateDataCopyWith<AccountUpdateData> get copyWith =>
      _$AccountUpdateDataCopyWithImpl<AccountUpdateData>(
          this as AccountUpdateData, _$identity);

  /// Serializes this AccountUpdateData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountUpdateData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance, currency);

  @override
  String toString() {
    return 'AccountUpdateData(id: $id, name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $AccountUpdateDataCopyWith<$Res> {
  factory $AccountUpdateDataCopyWith(
          AccountUpdateData value, $Res Function(AccountUpdateData) _then) =
      _$AccountUpdateDataCopyWithImpl;
  @useResult
  $Res call({int id, String name, String balance, String currency});
}

/// @nodoc
class _$AccountUpdateDataCopyWithImpl<$Res>
    implements $AccountUpdateDataCopyWith<$Res> {
  _$AccountUpdateDataCopyWithImpl(this._self, this._then);

  final AccountUpdateData _self;
  final $Res Function(AccountUpdateData) _then;

  /// Create a copy of AccountUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountUpdateData implements AccountUpdateData {
  const _AccountUpdateData(
      {required this.id,
      required this.name,
      required this.balance,
      required this.currency});
  factory _AccountUpdateData.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateDataFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String balance;
  @override
  final String currency;

  /// Create a copy of AccountUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountUpdateDataCopyWith<_AccountUpdateData> get copyWith =>
      __$AccountUpdateDataCopyWithImpl<_AccountUpdateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountUpdateDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountUpdateData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance, currency);

  @override
  String toString() {
    return 'AccountUpdateData(id: $id, name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$AccountUpdateDataCopyWith<$Res>
    implements $AccountUpdateDataCopyWith<$Res> {
  factory _$AccountUpdateDataCopyWith(
          _AccountUpdateData value, $Res Function(_AccountUpdateData) _then) =
      __$AccountUpdateDataCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String balance, String currency});
}

/// @nodoc
class __$AccountUpdateDataCopyWithImpl<$Res>
    implements _$AccountUpdateDataCopyWith<$Res> {
  __$AccountUpdateDataCopyWithImpl(this._self, this._then);

  final _AccountUpdateData _self;
  final $Res Function(_AccountUpdateData) _then;

  /// Create a copy of AccountUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_AccountUpdateData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
