// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsState {
  Category get category;
  String get lastTransactionTitle;
  List<Transaction> get transactions;
  double get amount;
  double get percentage;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsStateCopyWith<AnalyticsState> get copyWith =>
      _$AnalyticsStateCopyWithImpl<AnalyticsState>(
          this as AnalyticsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsState &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.lastTransactionTitle, lastTransactionTitle) ||
                other.lastTransactionTitle == lastTransactionTitle) &&
            const DeepCollectionEquality()
                .equals(other.transactions, transactions) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, lastTransactionTitle,
      const DeepCollectionEquality().hash(transactions), amount, percentage);

  @override
  String toString() {
    return 'AnalyticsState(category: $category, lastTransactionTitle: $lastTransactionTitle, transactions: $transactions, amount: $amount, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsStateCopyWith(
          AnalyticsState value, $Res Function(AnalyticsState) _then) =
      _$AnalyticsStateCopyWithImpl;
  @useResult
  $Res call(
      {Category category,
      String lastTransactionTitle,
      List<Transaction> transactions,
      double amount,
      double percentage});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._self, this._then);

  final AnalyticsState _self;
  final $Res Function(AnalyticsState) _then;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? lastTransactionTitle = null,
    Object? transactions = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_self.copyWith(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      lastTransactionTitle: null == lastTransactionTitle
          ? _self.lastTransactionTitle
          : lastTransactionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _self.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc

class _AnalyticsModel implements AnalyticsState {
  const _AnalyticsModel(
      {required this.category,
      required this.lastTransactionTitle,
      required final List<Transaction> transactions,
      required this.amount,
      required this.percentage})
      : _transactions = transactions;

  @override
  final Category category;
  @override
  final String lastTransactionTitle;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final double amount;
  @override
  final double percentage;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsModelCopyWith<_AnalyticsModel> get copyWith =>
      __$AnalyticsModelCopyWithImpl<_AnalyticsModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.lastTransactionTitle, lastTransactionTitle) ||
                other.lastTransactionTitle == lastTransactionTitle) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, lastTransactionTitle,
      const DeepCollectionEquality().hash(_transactions), amount, percentage);

  @override
  String toString() {
    return 'AnalyticsState(category: $category, lastTransactionTitle: $lastTransactionTitle, transactions: $transactions, amount: $amount, percentage: $percentage)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsModelCopyWith<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  factory _$AnalyticsModelCopyWith(
          _AnalyticsModel value, $Res Function(_AnalyticsModel) _then) =
      __$AnalyticsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Category category,
      String lastTransactionTitle,
      List<Transaction> transactions,
      double amount,
      double percentage});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$AnalyticsModelCopyWithImpl<$Res>
    implements _$AnalyticsModelCopyWith<$Res> {
  __$AnalyticsModelCopyWithImpl(this._self, this._then);

  final _AnalyticsModel _self;
  final $Res Function(_AnalyticsModel) _then;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
    Object? lastTransactionTitle = null,
    Object? transactions = null,
    Object? amount = null,
    Object? percentage = null,
  }) {
    return _then(_AnalyticsModel(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      lastTransactionTitle: null == lastTransactionTitle
          ? _self.lastTransactionTitle
          : lastTransactionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _self._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

// dart format on
