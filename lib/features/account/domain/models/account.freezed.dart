// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {
  int get id;
  int get apiId;
  String get name;
  String get balance;
  String get currency;
  List<StatItem> get incomeStats;
  List<StatItem> get expenseStats;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCopyWith<Account> get copyWith =>
      _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.apiId, apiId) || other.apiId == apiId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other.incomeStats, incomeStats) &&
            const DeepCollectionEquality()
                .equals(other.expenseStats, expenseStats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      apiId,
      name,
      balance,
      currency,
      const DeepCollectionEquality().hash(incomeStats),
      const DeepCollectionEquality().hash(expenseStats),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, apiId: $apiId, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) =
      _$AccountCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int apiId,
      String name,
      String balance,
      String currency,
      List<StatItem> incomeStats,
      List<StatItem> expenseStats,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? apiId = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? incomeStats = null,
    Object? expenseStats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      apiId: null == apiId
          ? _self.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
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
      incomeStats: null == incomeStats
          ? _self.incomeStats
          : incomeStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      expenseStats: null == expenseStats
          ? _self.expenseStats
          : expenseStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Account extends Account {
  const _Account(
      {required this.id,
      required this.apiId,
      required this.name,
      required this.balance,
      required this.currency,
      final List<StatItem> incomeStats = const [],
      final List<StatItem> expenseStats = const [],
      required this.createdAt,
      required this.updatedAt})
      : _incomeStats = incomeStats,
        _expenseStats = expenseStats,
        super._();
  factory _Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  final int id;
  @override
  final int apiId;
  @override
  final String name;
  @override
  final String balance;
  @override
  final String currency;
  final List<StatItem> _incomeStats;
  @override
  @JsonKey()
  List<StatItem> get incomeStats {
    if (_incomeStats is EqualUnmodifiableListView) return _incomeStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeStats);
  }

  final List<StatItem> _expenseStats;
  @override
  @JsonKey()
  List<StatItem> get expenseStats {
    if (_expenseStats is EqualUnmodifiableListView) return _expenseStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseStats);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.apiId, apiId) || other.apiId == apiId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality()
                .equals(other._incomeStats, _incomeStats) &&
            const DeepCollectionEquality()
                .equals(other._expenseStats, _expenseStats) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      apiId,
      name,
      balance,
      currency,
      const DeepCollectionEquality().hash(_incomeStats),
      const DeepCollectionEquality().hash(_expenseStats),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, apiId: $apiId, name: $name, balance: $balance, currency: $currency, incomeStats: $incomeStats, expenseStats: $expenseStats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) =
      __$AccountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int apiId,
      String name,
      String balance,
      String currency,
      List<StatItem> incomeStats,
      List<StatItem> expenseStats,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? apiId = null,
    Object? name = null,
    Object? balance = null,
    Object? currency = null,
    Object? incomeStats = null,
    Object? expenseStats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Account(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      apiId: null == apiId
          ? _self.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
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
      incomeStats: null == incomeStats
          ? _self._incomeStats
          : incomeStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      expenseStats: null == expenseStats
          ? _self._expenseStats
          : expenseStats // ignore: cast_nullable_to_non_nullable
              as List<StatItem>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
