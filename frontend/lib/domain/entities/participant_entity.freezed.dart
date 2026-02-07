// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ParticipantEntity _$ParticipantEntityFromJson(Map<String, dynamic> json) {
  return _ParticipantEntity.fromJson(json);
}

/// @nodoc
mixin _$ParticipantEntity {
  String get id => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  EventEntity get event => throw _privateConstructorUsedError;
  ParticipantStatus get status => throw _privateConstructorUsedError;

  /// Serializes this ParticipantEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantEntityCopyWith<ParticipantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantEntityCopyWith<$Res> {
  factory $ParticipantEntityCopyWith(
    ParticipantEntity value,
    $Res Function(ParticipantEntity) then,
  ) = _$ParticipantEntityCopyWithImpl<$Res, ParticipantEntity>;
  @useResult
  $Res call({
    String id,
    UserEntity user,
    EventEntity event,
    ParticipantStatus status,
  });

  $UserEntityCopyWith<$Res> get user;
  $EventEntityCopyWith<$Res> get event;
}

/// @nodoc
class _$ParticipantEntityCopyWithImpl<$Res, $Val extends ParticipantEntity>
    implements $ParticipantEntityCopyWith<$Res> {
  _$ParticipantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? event = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserEntity,
            event: null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                      as EventEntity,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ParticipantStatus,
          )
          as $Val,
    );
  }

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventEntityCopyWith<$Res> get event {
    return $EventEntityCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParticipantEntityImplCopyWith<$Res>
    implements $ParticipantEntityCopyWith<$Res> {
  factory _$$ParticipantEntityImplCopyWith(
    _$ParticipantEntityImpl value,
    $Res Function(_$ParticipantEntityImpl) then,
  ) = __$$ParticipantEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    UserEntity user,
    EventEntity event,
    ParticipantStatus status,
  });

  @override
  $UserEntityCopyWith<$Res> get user;
  @override
  $EventEntityCopyWith<$Res> get event;
}

/// @nodoc
class __$$ParticipantEntityImplCopyWithImpl<$Res>
    extends _$ParticipantEntityCopyWithImpl<$Res, _$ParticipantEntityImpl>
    implements _$$ParticipantEntityImplCopyWith<$Res> {
  __$$ParticipantEntityImplCopyWithImpl(
    _$ParticipantEntityImpl _value,
    $Res Function(_$ParticipantEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? event = null,
    Object? status = null,
  }) {
    return _then(
      _$ParticipantEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserEntity,
        event: null == event
            ? _value.event
            : event // ignore: cast_nullable_to_non_nullable
                  as EventEntity,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ParticipantStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipantEntityImpl implements _ParticipantEntity {
  const _$ParticipantEntityImpl({
    required this.id,
    required this.user,
    required this.event,
    required this.status,
  });

  factory _$ParticipantEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipantEntityImplFromJson(json);

  @override
  final String id;
  @override
  final UserEntity user;
  @override
  final EventEntity event;
  @override
  final ParticipantStatus status;

  @override
  String toString() {
    return 'ParticipantEntity(id: $id, user: $user, event: $event, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, event, status);

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantEntityImplCopyWith<_$ParticipantEntityImpl> get copyWith =>
      __$$ParticipantEntityImplCopyWithImpl<_$ParticipantEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipantEntityImplToJson(this);
  }
}

abstract class _ParticipantEntity implements ParticipantEntity {
  const factory _ParticipantEntity({
    required final String id,
    required final UserEntity user,
    required final EventEntity event,
    required final ParticipantStatus status,
  }) = _$ParticipantEntityImpl;

  factory _ParticipantEntity.fromJson(Map<String, dynamic> json) =
      _$ParticipantEntityImpl.fromJson;

  @override
  String get id;
  @override
  UserEntity get user;
  @override
  EventEntity get event;
  @override
  ParticipantStatus get status;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantEntityImplCopyWith<_$ParticipantEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
