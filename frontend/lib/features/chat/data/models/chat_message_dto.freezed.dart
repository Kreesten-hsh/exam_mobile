// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) {
  return _ChatMessageDto.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_name')
  String get senderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_gender')
  String get senderGender => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_avatar')
  String get senderAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageDtoCopyWith<ChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageDtoCopyWith<$Res> {
  factory $ChatMessageDtoCopyWith(
          ChatMessageDto value, $Res Function(ChatMessageDto) then) =
      _$ChatMessageDtoCopyWithImpl<$Res, ChatMessageDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'sender_name') String senderName,
      @JsonKey(name: 'sender_gender') String senderGender,
      @JsonKey(name: 'sender_avatar') String senderAvatar,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res, $Val extends ChatMessageDto>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._value, this._then);

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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageDtoImplCopyWith<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  factory _$$ChatMessageDtoImplCopyWith(_$ChatMessageDtoImpl value,
          $Res Function(_$ChatMessageDtoImpl) then) =
      __$$ChatMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'sender_id') String senderId,
      @JsonKey(name: 'sender_name') String senderName,
      @JsonKey(name: 'sender_gender') String senderGender,
      @JsonKey(name: 'sender_avatar') String senderAvatar,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ChatMessageDtoImplCopyWithImpl<$Res>
    extends _$ChatMessageDtoCopyWithImpl<$Res, _$ChatMessageDtoImpl>
    implements _$$ChatMessageDtoImplCopyWith<$Res> {
  __$$ChatMessageDtoImplCopyWithImpl(
      _$ChatMessageDtoImpl _value, $Res Function(_$ChatMessageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderGender = null,
    Object? senderAvatar = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChatMessageDtoImpl(
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageDtoImpl implements _ChatMessageDto {
  const _$ChatMessageDtoImpl(
      {required this.id,
      @JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'sender_name') required this.senderName,
      @JsonKey(name: 'sender_gender') required this.senderGender,
      @JsonKey(name: 'sender_avatar') this.senderAvatar = '',
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'type') this.type = 'text',
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ChatMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey(name: 'sender_name')
  final String senderName;
  @override
  @JsonKey(name: 'sender_gender')
  final String senderGender;
  @override
  @JsonKey(name: 'sender_avatar')
  final String senderAvatar;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChatMessageDto(id: $id, senderId: $senderId, senderName: $senderName, senderGender: $senderGender, senderAvatar: $senderAvatar, content: $content, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderGender, senderGender) ||
                other.senderGender == senderGender) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, senderName,
      senderGender, senderAvatar, content, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageDtoImplCopyWith<_$ChatMessageDtoImpl> get copyWith =>
      __$$ChatMessageDtoImplCopyWithImpl<_$ChatMessageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageDtoImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageDto implements ChatMessageDto {
  const factory _ChatMessageDto(
          {required final String id,
          @JsonKey(name: 'sender_id') required final String senderId,
          @JsonKey(name: 'sender_name') required final String senderName,
          @JsonKey(name: 'sender_gender') required final String senderGender,
          @JsonKey(name: 'sender_avatar') final String senderAvatar,
          @JsonKey(name: 'content') required final String content,
          @JsonKey(name: 'type') final String type,
          @JsonKey(name: 'created_at') required final DateTime createdAt}) =
      _$ChatMessageDtoImpl;

  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) =
      _$ChatMessageDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  @JsonKey(name: 'sender_name')
  String get senderName;
  @override
  @JsonKey(name: 'sender_gender')
  String get senderGender;
  @override
  @JsonKey(name: 'sender_avatar')
  String get senderAvatar;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageDtoImplCopyWith<_$ChatMessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
