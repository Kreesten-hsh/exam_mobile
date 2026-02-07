import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';
part 'event_entity.g.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String name,
    required String description,
    required DateTime date,
    required String location,
    required int maxMen,
    required int maxWomen,
    required double priceFull,
    required double priceDeposit,
    String? mediaUrl, // For cover image
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);
}
