// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      profilePhotoUrl: json['profile_photo_url'] as String?,
      role: json['role'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'birth_date': instance.birthDate.toIso8601String(),
      'profile_photo_url': instance.profilePhotoUrl,
      'role': instance.role,
      'token': instance.token,
    };
