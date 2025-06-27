// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountCreateData {
  String get name;
  String get balance;
  String get currency;

  /// Create a copy of AccountCreateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCreateDataCopyWith<AccountCreateData> get copyWith =>
      _$AccountCreateDataCopyWithImpl<AccountCreateData>(
          this as AccountCreateData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountCreateData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance, currency);

  @override
  String toString() {
    return 'AccountCreateData(name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $AccountCreateDataCopyWith<$Res> {
  factory $AccountCreateDataCopyWith(
          AccountCreateData value, $Res Function(AccountCreateData) _then) =
      _$AccountCreateDataCopyWithImpl;
  @useResult
  $Res call({String name, String balance, String currency});
}

/// @nodoc
class _$AccountCreateDataCopyWithImpl<$Res>
    implements $AccountCreateDataCopyWith<$Res> {
  _$AccountCreateDataCopyWithImpl(this._self, this._then);

  final AccountCreateData _self;
  final $Res Function(AccountCreateData) _then;

  /// Create a copy of AccountCreateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
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

class _AccountCreateData implements AccountCreateData {
  const _AccountCreateData(
      {required this.name, required this.balance, required this.currency});

  @override
  final String name;
  @override
  final String balance;
  @override
  final String currency;

  /// Create a copy of AccountCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCreateDataCopyWith<_AccountCreateData> get copyWith =>
      __$AccountCreateDataCopyWithImpl<_AccountCreateData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountCreateData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance, currency);

  @override
  String toString() {
    return 'AccountCreateData(name: $name, balance: $balance, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$AccountCreateDataCopyWith<$Res>
    implements $AccountCreateDataCopyWith<$Res> {
  factory _$AccountCreateDataCopyWith(
          _AccountCreateData value, $Res Function(_AccountCreateData) _then) =
      __$AccountCreateDataCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String balance, String currency});
}

/// @nodoc
class __$AccountCreateDataCopyWithImpl<$Res>
    implements _$AccountCreateDataCopyWith<$Res> {
  __$AccountCreateDataCopyWithImpl(this._self, this._then);

  final _AccountCreateData _self;
  final $Res Function(_AccountCreateData) _then;

  /// Create a copy of AccountCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
  }) {
    return _then(_AccountCreateData(
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
