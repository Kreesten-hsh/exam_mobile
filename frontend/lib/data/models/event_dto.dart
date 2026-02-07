// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/event_entity.dart';

part 'event_dto.g.dart';

@JsonSerializable(createToJson: false)
class EventDto {
  final String id;
  final String name;
  final String description;
  final DateTime date;
  final String location;
  @JsonKey(name: 'max_men')
  final int maxMen;
  @JsonKey(name: 'max_women')
  final int maxWomen;
  @JsonKey(name: 'price_full')
  final dynamic priceFull; // Handle string or number from API
  @JsonKey(name: 'price_deposit')
  final dynamic priceDeposit;

  EventDto({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.maxMen,
    required this.maxWomen,
    required this.priceFull,
    required this.priceDeposit,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  EventEntity toDomain() {
    return EventEntity(
      id: id,
      name: name,
      description: description,
      date: date,
      location: location,
      maxMen: maxMen,
      maxWomen: maxWomen,
      priceFull: double.tryParse(priceFull.toString()) ?? 0.0,
      priceDeposit: double.tryParse(priceDeposit.toString()) ?? 0.0,
    );
  }
}
