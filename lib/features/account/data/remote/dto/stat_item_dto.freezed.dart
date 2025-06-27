// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatItemDto {
  int get id;
  String get name;
  String get value;

  /// Create a copy of StatItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatItemDtoCopyWith<StatItemDto> get copyWith =>
      _$StatItemDtoCopyWithImpl<StatItemDto>(this as StatItemDto, _$identity);

  /// Serializes this StatItemDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @override
  String toString() {
    return 'StatItemDto(id: $id, name: $name, value: $value)';
  }
}

/// @nodoc
abstract mixin class $StatItemDtoCopyWith<$Res> {
  factory $StatItemDtoCopyWith(
          StatItemDto value, $Res Function(StatItemDto) _then) =
      _$StatItemDtoCopyWithImpl;
  @useResult
  $Res call({int id, String name, String value});
}

/// @nodoc
class _$StatItemDtoCopyWithImpl<$Res> implements $StatItemDtoCopyWith<$Res> {
  _$StatItemDtoCopyWithImpl(this._self, this._then);

  final StatItemDto _self;
  final $Res Function(StatItemDto) _then;

  /// Create a copy of StatItemDto
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
class _StatItemDto extends StatItemDto {
  const _StatItemDto(
      {required this.id, required this.name, required this.value})
      : super._();
  factory _StatItemDto.fromJson(Map<String, dynamic> json) =>
      _$StatItemDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String value;

  /// Create a copy of StatItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatItemDtoCopyWith<_StatItemDto> get copyWith =>
      __$StatItemDtoCopyWithImpl<_StatItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatItemDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @override
  String toString() {
    return 'StatItemDto(id: $id, name: $name, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$StatItemDtoCopyWith<$Res>
    implements $StatItemDtoCopyWith<$Res> {
  factory _$StatItemDtoCopyWith(
          _StatItemDto value, $Res Function(_StatItemDto) _then) =
      __$StatItemDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, String value});
}

/// @nodoc
class __$StatItemDtoCopyWithImpl<$Res> implements _$StatItemDtoCopyWith<$Res> {
  __$StatItemDtoCopyWithImpl(this._self, this._then);

  final _StatItemDto _self;
  final $Res Function(_StatItemDto) _then;

  /// Create a copy of StatItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_StatItemDto(
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
