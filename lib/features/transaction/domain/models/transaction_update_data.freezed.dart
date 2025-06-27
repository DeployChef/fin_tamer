// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_update_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionUpdateData {
  int get id;
  int get accountId;
  int get categoryId;
  String get amount;
  DateTime get transactionDate;
  String? get comment;

  /// Create a copy of TransactionUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionUpdateDataCopyWith<TransactionUpdateData> get copyWith =>
      _$TransactionUpdateDataCopyWithImpl<TransactionUpdateData>(
          this as TransactionUpdateData, _$identity);

  /// Serializes this TransactionUpdateData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionUpdateData &&
            (identical(other.id, id) || other.id == id) &&
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
      runtimeType, id, accountId, categoryId, amount, transactionDate, comment);

  @override
  String toString() {
    return 'TransactionUpdateData(id: $id, accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $TransactionUpdateDataCopyWith<$Res> {
  factory $TransactionUpdateDataCopyWith(TransactionUpdateData value,
          $Res Function(TransactionUpdateData) _then) =
      _$TransactionUpdateDataCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int accountId,
      int categoryId,
      String amount,
      DateTime transactionDate,
      String? comment});
}

/// @nodoc
class _$TransactionUpdateDataCopyWithImpl<$Res>
    implements $TransactionUpdateDataCopyWith<$Res> {
  _$TransactionUpdateDataCopyWithImpl(this._self, this._then);

  final TransactionUpdateData _self;
  final $Res Function(TransactionUpdateData) _then;

  /// Create a copy of TransactionUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? transactionDate = null,
    Object? comment = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String,
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
class _TransactionUpdateData extends TransactionUpdateData {
  const _TransactionUpdateData(
      {required this.id,
      required this.accountId,
      required this.categoryId,
      required this.amount,
      required this.transactionDate,
      this.comment})
      : super._();
  factory _TransactionUpdateData.fromJson(Map<String, dynamic> json) =>
      _$TransactionUpdateDataFromJson(json);

  @override
  final int id;
  @override
  final int accountId;
  @override
  final int categoryId;
  @override
  final String amount;
  @override
  final DateTime transactionDate;
  @override
  final String? comment;

  /// Create a copy of TransactionUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionUpdateDataCopyWith<_TransactionUpdateData> get copyWith =>
      __$TransactionUpdateDataCopyWithImpl<_TransactionUpdateData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionUpdateDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionUpdateData &&
            (identical(other.id, id) || other.id == id) &&
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
      runtimeType, id, accountId, categoryId, amount, transactionDate, comment);

  @override
  String toString() {
    return 'TransactionUpdateData(id: $id, accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$TransactionUpdateDataCopyWith<$Res>
    implements $TransactionUpdateDataCopyWith<$Res> {
  factory _$TransactionUpdateDataCopyWith(_TransactionUpdateData value,
          $Res Function(_TransactionUpdateData) _then) =
      __$TransactionUpdateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int accountId,
      int categoryId,
      String amount,
      DateTime transactionDate,
      String? comment});
}

/// @nodoc
class __$TransactionUpdateDataCopyWithImpl<$Res>
    implements _$TransactionUpdateDataCopyWith<$Res> {
  __$TransactionUpdateDataCopyWithImpl(this._self, this._then);

  final _TransactionUpdateData _self;
  final $Res Function(_TransactionUpdateData) _then;

  /// Create a copy of TransactionUpdateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? categoryId = null,
    Object? amount = null,
    Object? transactionDate = null,
    Object? comment = freezed,
  }) {
    return _then(_TransactionUpdateData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
              as String,
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
