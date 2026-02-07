import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String id;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String gender;
  @JsonKey(name: 'birth_date')
  final DateTime birthDate;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  final String role;
  final String? token; // Token might be in the response

  UserDto({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    this.profilePhotoUrl,
    required this.role,
    this.token,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserEntity toDomain() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      birthDate: birthDate,
      profilePhotoUrl: profilePhotoUrl,
      role: role,
    );
  }
}
