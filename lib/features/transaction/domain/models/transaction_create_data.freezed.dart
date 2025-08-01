// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_create_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionCreateData {
  int get accountId;
  int get categoryId;
  double get amount;
  DateTime get transactionDate;
  String? get comment;

  /// Create a copy of TransactionCreateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionCreateDataCopyWith<TransactionCreateData> get copyWith =>
      _$TransactionCreateDataCopyWithImpl<TransactionCreateData>(
          this as TransactionCreateData, _$identity);

  /// Serializes this TransactionCreateData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionCreateData &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accountId, categoryId, amount, transactionDate, comment);

  @override
  String toString() {
    return 'TransactionCreateData(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $TransactionCreateDataCopyWith<$Res> {
  factory $TransactionCreateDataCopyWith(TransactionCreateData value,
          $Res Function(TransactionCreateData) _then) =
      _$TransactionCreateDataCopyWithImpl;
  @useResult
  $Res call(
      {int accountId,
      int categoryId,
      double amount,
      DateTime transactionDate,
      String? comment});
}

/// @nodoc
class _$TransactionCreateDataCopyWithImpl<$Res>
    implements $TransactionCreateDataCopyWith<$Res> {
  _$TransactionCreateDataCopyWithImpl(this._self, this._then);

  final TransactionCreateData _self;
  final $Res Function(TransactionCreateData) _then;

  /// Create a copy of TransactionCreateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? transactionDate = null,
    Object? comment = freezed,
  }) {
    return _then(_self.copyWith(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionCreateData extends TransactionCreateData {
  const _TransactionCreateData(
      {required this.accountId,
      required this.categoryId,
      required this.amount,
      required this.transactionDate,
      this.comment})
      : super._();
  factory _TransactionCreateData.fromJson(Map<String, dynamic> json) =>
      _$TransactionCreateDataFromJson(json);

  @override
  final int accountId;
  @override
  final int categoryId;
  @override
  final double amount;
  @override
  final DateTime transactionDate;
  @override
  final String? comment;

  /// Create a copy of TransactionCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionCreateDataCopyWith<_TransactionCreateData> get copyWith =>
      __$TransactionCreateDataCopyWithImpl<_TransactionCreateData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionCreateDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionCreateData &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, accountId, categoryId, amount, transactionDate, comment);

  @override
  String toString() {
    return 'TransactionCreateData(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$TransactionCreateDataCopyWith<$Res>
    implements $TransactionCreateDataCopyWith<$Res> {
  factory _$TransactionCreateDataCopyWith(_TransactionCreateData value,
          $Res Function(_TransactionCreateData) _then) =
      __$TransactionCreateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int accountId,
      int categoryId,
      double amount,
      DateTime transactionDate,
      String? comment});
}

/// @nodoc
class __$TransactionCreateDataCopyWithImpl<$Res>
    implements _$TransactionCreateDataCopyWith<$Res> {
  __$TransactionCreateDataCopyWithImpl(this._self, this._then);

  final _TransactionCreateData _self;
  final $Res Function(_TransactionCreateData) _then;

  /// Create a copy of TransactionCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? transactionDate = null,
    Object? comment = freezed,
  }) {
    return _then(_TransactionCreateData(
      accountId: null == accountId
          ? _self.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
