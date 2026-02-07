// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  date: DateTime.parse(json['date'] as String),
  location: json['location'] as String,
  maxMen: (json['max_men'] as num).toInt(),
  maxWomen: (json['max_women'] as num).toInt(),
  priceFull: json['price_full'],
  priceDeposit: json['price_deposit'],
);
