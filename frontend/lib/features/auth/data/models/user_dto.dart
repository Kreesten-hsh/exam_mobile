// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String gender,
    @JsonKey(name: 'birth_date') required DateTime birthDate,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
    required String role,
    String? token,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

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
