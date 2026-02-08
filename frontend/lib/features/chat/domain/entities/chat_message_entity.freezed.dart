// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageEntity _$ChatMessageEntityFromJson(Map<String, dynamic> json) {
  return _ChatMessageEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageEntity {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get senderGender =>
      throw _privateConstructorUsedError; // 'M' or 'F' (or enum)
  String get senderAvatar => throw _privateConstructorUsedError;
  bool get isMine => throw _privateConstructorUsedError;
  String get content =>
      throw _privateConstructorUsedError; // Text content or Audio URL
  MessageType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageEntityCopyWith<ChatMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageEntityCopyWith<$Res> {
  factory $ChatMessageEntityCopyWith(
          ChatMessageEntity value, $Res Function(ChatMessageEntity) then) =
      _$ChatMessageEntityCopyWithImpl<$Res, ChatMessageEntity>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String senderName,
      String senderGender,
      String senderAvatar,
      bool isMine,
      String content,
      MessageType type,
      DateTime createdAt});
}

/// @nodoc
class _$ChatMessageEntityCopyWithImpl<$Res, $Val extends ChatMessageEntity>
    implements $ChatMessageEntityCopyWith<$Res> {
  _$ChatMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderGender = null,
    Object? senderAvatar = null,
    Object? isMine = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderGender: null == senderGender
          ? _value.senderGender
          : senderGender // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatar: null == senderAvatar
          ? _value.senderAvatar
          : senderAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      isMine: null == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageEntityImplCopyWith<$Res>
    implements $ChatMessageEntityCopyWith<$Res> {
  factory _$$ChatMessageEntityImplCopyWith(_$ChatMessageEntityImpl value,
          $Res Function(_$ChatMessageEntityImpl) then) =
      __$$ChatMessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String senderName,
      String senderGender,
      String senderAvatar,
      bool isMine,
      String content,
      MessageType type,
      DateTime createdAt});
}

/// @nodoc
class __$$ChatMessageEntityImplCopyWithImpl<$Res>
    extends _$ChatMessageEntityCopyWithImpl<$Res, _$ChatMessageEntityImpl>
    implements _$$ChatMessageEntityImplCopyWith<$Res> {
  __$$ChatMessageEntityImplCopyWithImpl(_$ChatMessageEntityImpl _value,
      $Res Function(_$ChatMessageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderGender = null,
    Object? senderAvatar = null,
    Object? isMine = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChatMessageEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderGender: null == senderGender
          ? _value.senderGender
          : senderGender // ignore: cast_nullable_to_non_nullable
              as String,
      senderAvatar: null == senderAvatar
          ? _value.senderAvatar
          : senderAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      isMine: null == isMine
          ? _value.isMine
          : isMine // ignore: cast_nullable_to_non_nullable
              as bool,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageEntityImpl implements _ChatMessageEntity {
  const _$ChatMessageEntityImpl(
      {required this.id,
      required this.senderId,
      required this.senderName,
      required this.senderGender,
      this.senderAvatar = '',
      required this.isMine,
      required this.content,
      this.type = MessageType.text,
      required this.createdAt});

  factory _$ChatMessageEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String senderGender;
// 'M' or 'F' (or enum)
  @override
  @JsonKey()
  final String senderAvatar;
  @override
  final bool isMine;
  @override
  final String content;
// Text content or Audio URL
  @override
  @JsonKey()
  final MessageType type;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChatMessageEntity(id: $id, senderId: $senderId, senderName: $senderName, senderGender: $senderGender, senderAvatar: $senderAvatar, isMine: $isMine, content: $content, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderGender, senderGender) ||
                other.senderGender == senderGender) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.isMine, isMine) || other.isMine == isMine) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, senderName,
      senderGender, senderAvatar, isMine, content, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageEntityImplCopyWith<_$ChatMessageEntityImpl> get copyWith =>
      __$$ChatMessageEntityImplCopyWithImpl<_$ChatMessageEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageEntityImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageEntity implements ChatMessageEntity {
  const factory _ChatMessageEntity(
      {required final String id,
      required final String senderId,
      required final String senderName,
      required final String senderGender,
      final String senderAvatar,
      required final bool isMine,
      required final String content,
      final MessageType type,
      required final DateTime createdAt}) = _$ChatMessageEntityImpl;

  factory _ChatMessageEntity.fromJson(Map<String, dynamic> json) =
      _$ChatMessageEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String get senderGender;
  @override // 'M' or 'F' (or enum)
  String get senderAvatar;
  @override
  bool get isMine;
  @override
  String get content;
  @override // Text content or Audio URL
  MessageType get type;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageEntityImplCopyWith<_$ChatMessageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
