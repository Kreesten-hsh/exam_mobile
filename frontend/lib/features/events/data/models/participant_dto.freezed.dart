// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipantDto _$ParticipantDtoFromJson(Map<String, dynamic> json) {
  return _ParticipantDto.fromJson(json);
}

/// @nodoc
mixin _$ParticipantDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantDtoCopyWith<ParticipantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantDtoCopyWith<$Res> {
  factory $ParticipantDtoCopyWith(
          ParticipantDto value, $Res Function(ParticipantDto) then) =
      _$ParticipantDtoCopyWithImpl<$Res, ParticipantDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      String gender,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class _$ParticipantDtoCopyWithImpl<$Res, $Val extends ParticipantDto>
    implements $ParticipantDtoCopyWith<$Res> {
  _$ParticipantDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? gender = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipantDtoImplCopyWith<$Res>
    implements $ParticipantDtoCopyWith<$Res> {
  factory _$$ParticipantDtoImplCopyWith(_$ParticipantDtoImpl value,
          $Res Function(_$ParticipantDtoImpl) then) =
      __$$ParticipantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      String gender,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class __$$ParticipantDtoImplCopyWithImpl<$Res>
    extends _$ParticipantDtoCopyWithImpl<$Res, _$ParticipantDtoImpl>
    implements _$$ParticipantDtoImplCopyWith<$Res> {
  __$$ParticipantDtoImplCopyWithImpl(
      _$ParticipantDtoImpl _value, $Res Function(_$ParticipantDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? gender = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$ParticipantDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantDtoImpl extends _ParticipantDto {
  const _$ParticipantDtoImpl(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      required this.gender,
      @JsonKey(name: 'avatar_url') this.avatarUrl})
      : super._();

  factory _$ParticipantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final String gender;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'ParticipantDto(id: $id, firstName: $firstName, gender: $gender, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, firstName, gender, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantDtoImplCopyWith<_$ParticipantDtoImpl> get copyWith =>
      __$$ParticipantDtoImplCopyWithImpl<_$ParticipantDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantDtoImplToJson(
      this,
    );
  }
}

abstract class _ParticipantDto extends ParticipantDto {
  const factory _ParticipantDto(
          {required final String id,
          @JsonKey(name: 'first_name') required final String firstName,
          required final String gender,
          @JsonKey(name: 'avatar_url') final String? avatarUrl}) =
      _$ParticipantDtoImpl;
  const _ParticipantDto._() : super._();

  factory _ParticipantDto.fromJson(Map<String, dynamic> json) =
      _$ParticipantDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  String get gender;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$ParticipantDtoImplCopyWith<_$ParticipantDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
