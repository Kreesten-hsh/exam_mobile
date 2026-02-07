// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
      'profilePhotoUrl': instance.profilePhotoUrl,
      'role': instance.role,
    };
