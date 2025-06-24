// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_filter_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryFilterStateModel {
  DateTime get startDate;
  DateTime get endDate;
  SortType get sortType;

  /// Create a copy of HistoryFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HistoryFilterStateModelCopyWith<HistoryFilterStateModel> get copyWith =>
      _$HistoryFilterStateModelCopyWithImpl<HistoryFilterStateModel>(
          this as HistoryFilterStateModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryFilterStateModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, sortType);

  @override
  String toString() {
    return 'HistoryFilterStateModel(startDate: $startDate, endDate: $endDate, sortType: $sortType)';
  }
}

/// @nodoc
abstract mixin class $HistoryFilterStateModelCopyWith<$Res> {
  factory $HistoryFilterStateModelCopyWith(HistoryFilterStateModel value,
          $Res Function(HistoryFilterStateModel) _then) =
      _$HistoryFilterStateModelCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate, SortType sortType});
}

/// @nodoc
class _$HistoryFilterStateModelCopyWithImpl<$Res>
    implements $HistoryFilterStateModelCopyWith<$Res> {
  _$HistoryFilterStateModelCopyWithImpl(this._self, this._then);

  final HistoryFilterStateModel _self;
  final $Res Function(HistoryFilterStateModel) _then;

  /// Create a copy of HistoryFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? sortType = null,
  }) {
    return _then(_self.copyWith(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sortType: null == sortType
          ? _self.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
    ));
  }
}

/// @nodoc

class _HistoryFilterStateModel implements HistoryFilterStateModel {
  const _HistoryFilterStateModel(
      {required this.startDate, required this.endDate, required this.sortType});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final SortType sortType;

  /// Create a copy of HistoryFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HistoryFilterStateModelCopyWith<_HistoryFilterStateModel> get copyWith =>
      __$HistoryFilterStateModelCopyWithImpl<_HistoryFilterStateModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HistoryFilterStateModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, sortType);

  @override
  String toString() {
    return 'HistoryFilterStateModel(startDate: $startDate, endDate: $endDate, sortType: $sortType)';
  }
}

/// @nodoc
abstract mixin class _$HistoryFilterStateModelCopyWith<$Res>
    implements $HistoryFilterStateModelCopyWith<$Res> {
  factory _$HistoryFilterStateModelCopyWith(_HistoryFilterStateModel value,
          $Res Function(_HistoryFilterStateModel) _then) =
      __$HistoryFilterStateModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate, SortType sortType});
}

/// @nodoc
class __$HistoryFilterStateModelCopyWithImpl<$Res>
    implements _$HistoryFilterStateModelCopyWith<$Res> {
  __$HistoryFilterStateModelCopyWithImpl(this._self, this._then);

  final _HistoryFilterStateModel _self;
  final $Res Function(_HistoryFilterStateModel) _then;

  /// Create a copy of HistoryFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? sortType = null,
  }) {
    return _then(_HistoryFilterStateModel(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sortType: null == sortType
          ? _self.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
    ));
  }
}

// dart format on
