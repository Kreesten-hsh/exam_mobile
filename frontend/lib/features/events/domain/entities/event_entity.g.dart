// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String?,
      maxMen: (json['maxMen'] as num).toInt(),
      maxWomen: (json['maxWomen'] as num).toInt(),
      priceFull: (json['priceFull'] as num).toDouble(),
      priceDeposit: (json['priceDeposit'] as num).toDouble(),
      mediaUrl: json['mediaUrl'] as String?,
      participantsCount: (json['participantsCount'] as num?)?.toInt() ?? 0,
      menCount: (json['menCount'] as num?)?.toInt() ?? 0,
      womenCount: (json['womenCount'] as num?)?.toInt() ?? 0,
      isRegistered: json['isRegistered'] as bool? ?? false,
      mediaUrls: (json['mediaUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'location': instance.location,
      'maxMen': instance.maxMen,
      'maxWomen': instance.maxWomen,
      'priceFull': instance.priceFull,
      'priceDeposit': instance.priceDeposit,
      'mediaUrl': instance.mediaUrl,
      'participantsCount': instance.participantsCount,
      'menCount': instance.menCount,
      'womenCount': instance.womenCount,
      'isRegistered': instance.isRegistered,
      'mediaUrls': instance.mediaUrls,
    };
