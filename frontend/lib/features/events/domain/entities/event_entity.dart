import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';
part 'event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String name,
    String? description, // Nullable as per backend agreement
    required DateTime date,
    String? location, // Nullable as per backend agreement
    required int maxMen,
    required int maxWomen,
    required double priceFull,
    required double priceDeposit,
    String? mediaUrl,
    @Default(0) int participantsCount,
    @Default(0) int menCount,
    @Default(0) int womenCount,
    @Default(false) bool isRegistered,
    @Default([]) List<String> mediaUrls,
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);
}
