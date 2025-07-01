// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountHistoryFeed {
  int get accountId;
  String get accountName;
  String get currency;
  double get currentBalance;
  List<AccountHistory> get history;

  /// Create a copy of AccountHistoryFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountHistoryFeedCopyWith<AccountHistoryFeed> get copyWith =>
      _$AccountHistoryFeedCopyWithImpl<AccountHistoryFeed>(
          this as AccountHistoryFeed, _$identity);

  /// Serializes this AccountHistoryFeed to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountHistoryFeed &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            const DeepCollectionEquality().equals(other.history, history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(history));

  @override
  String toString() {
    return 'AccountHistoryFeed(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
  }
}

/// @nodoc
abstract mixin class $AccountHistoryFeedCopyWith<$Res> {
  factory $AccountHistoryFeedCopyWith(
          AccountHistoryFeed value, $Res Function(AccountHistoryFeed) _then) =
      _$AccountHistoryFeedCopyWithImpl;
  @useResult
  $Res call(
      {int accountId,
      String accountName,
      String currency,
      double currentBalance,
      List<AccountHistory> history});
}

/// @nodoc
class _$AccountHistoryFeedCopyWithImpl<$Res>
    implements $AccountHistoryFeedCopyWith<$Res> {
  _$AccountHistoryFeedCopyWithImpl(this._self, this._then);

  final AccountHistoryFeed _self;
  final $Res Function(AccountHistoryFeed) _then;

  /// Create a copy of AccountHistoryFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? accountName = null,
    Object? currency = null,
    Object? currentBalance = null,
    Object? history = null,
  }) {
    return _then(_self.copyWith(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _self.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountHistoryFeed extends AccountHistoryFeed {
  const _AccountHistoryFeed(
      {required this.accountId,
      required this.accountName,
      required this.currency,
      required this.currentBalance,
      required final List<AccountHistory> history})
      : _history = history,
        super._();
  factory _AccountHistoryFeed.fromJson(Map<String, dynamic> json) =>
      _$AccountHistoryFeedFromJson(json);

  @override
  final int accountId;
  @override
  final String accountName;
  @override
  final String currency;
  @override
  final double currentBalance;
  final List<AccountHistory> _history;
  @override
  List<AccountHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  /// Create a copy of AccountHistoryFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountHistoryFeedCopyWith<_AccountHistoryFeed> get copyWith =>
      __$AccountHistoryFeedCopyWithImpl<_AccountHistoryFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountHistoryFeedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountHistoryFeed &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, accountName, currency,
      currentBalance, const DeepCollectionEquality().hash(_history));

  @override
  String toString() {
    return 'AccountHistoryFeed(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
  }
}

/// @nodoc
abstract mixin class _$AccountHistoryFeedCopyWith<$Res>
    implements $AccountHistoryFeedCopyWith<$Res> {
  factory _$AccountHistoryFeedCopyWith(
          _AccountHistoryFeed value, $Res Function(_AccountHistoryFeed) _then) =
      __$AccountHistoryFeedCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int accountId,
      String accountName,
      String currency,
      double currentBalance,
      List<AccountHistory> history});
}

/// @nodoc
class __$AccountHistoryFeedCopyWithImpl<$Res>
    implements _$AccountHistoryFeedCopyWith<$Res> {
  __$AccountHistoryFeedCopyWithImpl(this._self, this._then);

  final _AccountHistoryFeed _self;
  final $Res Function(_AccountHistoryFeed) _then;

  /// Create a copy of AccountHistoryFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountId = null,
    Object? accountName = null,
    Object? currency = null,
    Object? currentBalance = null,
    Object? history = null,
  }) {
    return _then(_AccountHistoryFeed(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      history: null == history
          ? _self._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>,
    ));
  }
}

// dart format on
