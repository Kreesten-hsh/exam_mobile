// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDtoImpl _$$EventDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      date: DateTime.parse(json['event_date'] as String),
      locationName: json['location_name'] as String?,
      locationAddress: json['location_address'] as String?,
      maxMen: (json['max_men'] as num).toInt(),
      maxWomen: (json['max_women'] as num).toInt(),
      priceFull: json['price_full'],
      priceDeposit: json['price_deposit'],
      mediaUrl: json['media_url'] as String?,
      participantsCount: (json['participants_count'] as num?)?.toInt() ?? 0,
      menCount: (json['men_count'] as num?)?.toInt() ?? 0,
      womenCount: (json['women_count'] as num?)?.toInt() ?? 0,
      isRegistered: json['is_registered'] as bool? ?? false,
      media: json['media'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$EventDtoImplToJson(_$EventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'event_date': instance.date.toIso8601String(),
      'location_name': instance.locationName,
      'location_address': instance.locationAddress,
      'max_men': instance.maxMen,
      'max_women': instance.maxWomen,
      'price_full': instance.priceFull,
      'price_deposit': instance.priceDeposit,
      'media_url': instance.mediaUrl,
      'participants_count': instance.participantsCount,
      'men_count': instance.menCount,
      'women_count': instance.womenCount,
      'is_registered': instance.isRegistered,
      'media': instance.media,
    };
