// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatItem {
  int get id;
  String get name;
  String get value;

  /// Create a copy of StatItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatItemCopyWith<StatItem> get copyWith =>
      _$StatItemCopyWithImpl<StatItem>(this as StatItem, _$identity);

  /// Serializes this StatItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @override
  String toString() {
    return 'StatItem(id: $id, name: $name, value: $value)';
  }
}

/// @nodoc
abstract mixin class $StatItemCopyWith<$Res> {
  factory $StatItemCopyWith(StatItem value, $Res Function(StatItem) _then) =
      _$StatItemCopyWithImpl;
  @useResult
  $Res call({int id, String name, String value});
}

/// @nodoc
class _$StatItemCopyWithImpl<$Res> implements $StatItemCopyWith<$Res> {
  _$StatItemCopyWithImpl(this._self, this._then);

  final StatItem _self;
  final $Res Function(StatItem) _then;

  /// Create a copy of StatItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
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
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StatItem extends StatItem {
  const _StatItem({required this.id, required this.name, required this.value})
      : super._();
  factory _StatItem.fromJson(Map<String, dynamic> json) =>
      _$StatItemFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String value;

  /// Create a copy of StatItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatItemCopyWith<_StatItem> get copyWith =>
      __$StatItemCopyWithImpl<_StatItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @override
  String toString() {
    return 'StatItem(id: $id, name: $name, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$StatItemCopyWith<$Res>
    implements $StatItemCopyWith<$Res> {
  factory _$StatItemCopyWith(_StatItem value, $Res Function(_StatItem) _then) =
      __$StatItemCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String value});
}

/// @nodoc
class __$StatItemCopyWithImpl<$Res> implements _$StatItemCopyWith<$Res> {
  __$StatItemCopyWithImpl(this._self, this._then);

  final _StatItem _self;
  final $Res Function(_StatItem) _then;

  /// Create a copy of StatItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_StatItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
