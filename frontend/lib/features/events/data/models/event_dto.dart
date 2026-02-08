// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/event_entity.dart';

part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@freezed
class EventDto with _$EventDto {
  const EventDto._();

  const factory EventDto({
    required String id,
    required String name,
    String? description,
    @JsonKey(name: 'event_date') required DateTime date,
    @JsonKey(name: 'location_name') String? locationName,
    @JsonKey(name: 'location_address') String? locationAddress,
    @JsonKey(name: 'max_men') required int maxMen,
    @JsonKey(name: 'max_women') required int maxWomen,
    @JsonKey(name: 'price_full') required dynamic priceFull,
    @JsonKey(name: 'price_deposit') required dynamic priceDeposit,
    @JsonKey(name: 'media_url') String? mediaUrl,
    @JsonKey(name: 'participants_count') @Default(0) int participantsCount,
    @JsonKey(name: 'men_count') @Default(0) int menCount,
    @JsonKey(name: 'women_count') @Default(0) int womenCount,
    @JsonKey(name: 'is_registered') @Default(false) bool isRegistered,
    // Map list of media objects to URL list, handled in toDomain or via custom converter
    // For simplicity, backend sends 'media' array, we can map it here.
    // However, if backend sends objects, we need a custom converter or just ignore and map in toDomain.
    // Let's assume generic map for now or ignore and rely on toDomain parsing if complex.
    // Actually, backend sends `media: [{id, url, ...}]`. better to handle as List<dynamic> and map.
    @Default([]) List<dynamic> media,
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  EventEntity toDomain() {
    // Safe location construction
    final locParts = [locationName, locationAddress]
        .where((s) => s != null && s.isNotEmpty)
        .join(', ');

    // Parse media URLs
    final urls = media.map((m) => m['url'] as String).toList();

    return EventEntity(
      id: id,
      name: name,
      description: description,
      date: date,
      location: locParts.isNotEmpty ? locParts : null,
      maxMen: maxMen,
      maxWomen: maxWomen,
      priceFull: _parseDouble(priceFull),
      priceDeposit: _parseDouble(priceDeposit),
      mediaUrl: mediaUrl,
      participantsCount: participantsCount,
      menCount: menCount,
      womenCount: womenCount,
      isRegistered: isRegistered,
      mediaUrls: urls,
    );
  }

  double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
