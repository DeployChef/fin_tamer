// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_filter_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsFilterStateModel {
  DateTime get startDate;
  DateTime get endDate;

  /// Create a copy of AnalyticsFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnalyticsFilterStateModelCopyWith<AnalyticsFilterStateModel> get copyWith =>
      _$AnalyticsFilterStateModelCopyWithImpl<AnalyticsFilterStateModel>(
          this as AnalyticsFilterStateModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnalyticsFilterStateModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'AnalyticsFilterStateModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class $AnalyticsFilterStateModelCopyWith<$Res> {
  factory $AnalyticsFilterStateModelCopyWith(AnalyticsFilterStateModel value,
          $Res Function(AnalyticsFilterStateModel) _then) =
      _$AnalyticsFilterStateModelCopyWithImpl;
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$AnalyticsFilterStateModelCopyWithImpl<$Res>
    implements $AnalyticsFilterStateModelCopyWith<$Res> {
  _$AnalyticsFilterStateModelCopyWithImpl(this._self, this._then);

  final AnalyticsFilterStateModel _self;
  final $Res Function(AnalyticsFilterStateModel) _then;

  /// Create a copy of AnalyticsFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
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
    ));
  }
}

/// @nodoc

class _AnalyticsFilterStateModel implements AnalyticsFilterStateModel {
  const _AnalyticsFilterStateModel(
      {required this.startDate, required this.endDate});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  /// Create a copy of AnalyticsFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnalyticsFilterStateModelCopyWith<_AnalyticsFilterStateModel>
      get copyWith =>
          __$AnalyticsFilterStateModelCopyWithImpl<_AnalyticsFilterStateModel>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyticsFilterStateModel &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @override
  String toString() {
    return 'AnalyticsFilterStateModel(startDate: $startDate, endDate: $endDate)';
  }
}

/// @nodoc
abstract mixin class _$AnalyticsFilterStateModelCopyWith<$Res>
    implements $AnalyticsFilterStateModelCopyWith<$Res> {
  factory _$AnalyticsFilterStateModelCopyWith(_AnalyticsFilterStateModel value,
          $Res Function(_AnalyticsFilterStateModel) _then) =
      __$AnalyticsFilterStateModelCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$AnalyticsFilterStateModelCopyWithImpl<$Res>
    implements _$AnalyticsFilterStateModelCopyWith<$Res> {
  __$AnalyticsFilterStateModelCopyWithImpl(this._self, this._then);

  final _AnalyticsFilterStateModel _self;
  final $Res Function(_AnalyticsFilterStateModel) _then;

  /// Create a copy of AnalyticsFilterStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_AnalyticsFilterStateModel(
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
