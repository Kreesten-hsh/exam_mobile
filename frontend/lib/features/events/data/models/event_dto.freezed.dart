// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDto _$EventDtoFromJson(Map<String, dynamic> json) {
  return _EventDto.fromJson(json);
}

/// @nodoc
mixin _$EventDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_name')
  String? get locationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_address')
  String? get locationAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_men')
  int get maxMen => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_women')
  int get maxWomen => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_full')
  dynamic get priceFull => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_deposit')
  dynamic get priceDeposit => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'participants_count')
  int get participantsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'men_count')
  int get menCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'women_count')
  int get womenCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_registered')
  bool get isRegistered =>
      throw _privateConstructorUsedError; // Map list of media objects to URL list, handled in toDomain or via custom converter
// For simplicity, backend sends 'media' array, we can map it here.
// However, if backend sends objects, we need a custom converter or just ignore and map in toDomain.
// Let's assume generic map for now or ignore and rely on toDomain parsing if complex.
// Actually, backend sends `media: [{id, url, ...}]`. better to handle as List<dynamic> and map.
  List<dynamic> get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventDtoCopyWith<EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res, EventDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(name: 'event_date') DateTime date,
      @JsonKey(name: 'location_name') String? locationName,
      @JsonKey(name: 'location_address') String? locationAddress,
      @JsonKey(name: 'max_men') int maxMen,
      @JsonKey(name: 'max_women') int maxWomen,
      @JsonKey(name: 'price_full') dynamic priceFull,
      @JsonKey(name: 'price_deposit') dynamic priceDeposit,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'participants_count') int participantsCount,
      @JsonKey(name: 'men_count') int menCount,
      @JsonKey(name: 'women_count') int womenCount,
      @JsonKey(name: 'is_registered') bool isRegistered,
      List<dynamic> media});
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res, $Val extends EventDto>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? date = null,
    Object? locationName = freezed,
    Object? locationAddress = freezed,
    Object? maxMen = null,
    Object? maxWomen = null,
    Object? priceFull = freezed,
    Object? priceDeposit = freezed,
    Object? mediaUrl = freezed,
    Object? participantsCount = null,
    Object? menCount = null,
    Object? womenCount = null,
    Object? isRegistered = null,
    Object? media = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationAddress: freezed == locationAddress
          ? _value.locationAddress
          : locationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      maxMen: null == maxMen
          ? _value.maxMen
          : maxMen // ignore: cast_nullable_to_non_nullable
              as int,
      maxWomen: null == maxWomen
          ? _value.maxWomen
          : maxWomen // ignore: cast_nullable_to_non_nullable
              as int,
      priceFull: freezed == priceFull
          ? _value.priceFull
          : priceFull // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priceDeposit: freezed == priceDeposit
          ? _value.priceDeposit
          : priceDeposit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      participantsCount: null == participantsCount
          ? _value.participantsCount
          : participantsCount // ignore: cast_nullable_to_non_nullable
              as int,
      menCount: null == menCount
          ? _value.menCount
          : menCount // ignore: cast_nullable_to_non_nullable
              as int,
      womenCount: null == womenCount
          ? _value.womenCount
          : womenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDtoImplCopyWith<$Res>
    implements $EventDtoCopyWith<$Res> {
  factory _$$EventDtoImplCopyWith(
          _$EventDtoImpl value, $Res Function(_$EventDtoImpl) then) =
      __$$EventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(name: 'event_date') DateTime date,
      @JsonKey(name: 'location_name') String? locationName,
      @JsonKey(name: 'location_address') String? locationAddress,
      @JsonKey(name: 'max_men') int maxMen,
      @JsonKey(name: 'max_women') int maxWomen,
      @JsonKey(name: 'price_full') dynamic priceFull,
      @JsonKey(name: 'price_deposit') dynamic priceDeposit,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'participants_count') int participantsCount,
      @JsonKey(name: 'men_count') int menCount,
      @JsonKey(name: 'women_count') int womenCount,
      @JsonKey(name: 'is_registered') bool isRegistered,
      List<dynamic> media});
}

/// @nodoc
class __$$EventDtoImplCopyWithImpl<$Res>
    extends _$EventDtoCopyWithImpl<$Res, _$EventDtoImpl>
    implements _$$EventDtoImplCopyWith<$Res> {
  __$$EventDtoImplCopyWithImpl(
      _$EventDtoImpl _value, $Res Function(_$EventDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? date = null,
    Object? locationName = freezed,
    Object? locationAddress = freezed,
    Object? maxMen = null,
    Object? maxWomen = null,
    Object? priceFull = freezed,
    Object? priceDeposit = freezed,
    Object? mediaUrl = freezed,
    Object? participantsCount = null,
    Object? menCount = null,
    Object? womenCount = null,
    Object? isRegistered = null,
    Object? media = null,
  }) {
    return _then(_$EventDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationAddress: freezed == locationAddress
          ? _value.locationAddress
          : locationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      maxMen: null == maxMen
          ? _value.maxMen
          : maxMen // ignore: cast_nullable_to_non_nullable
              as int,
      maxWomen: null == maxWomen
          ? _value.maxWomen
          : maxWomen // ignore: cast_nullable_to_non_nullable
              as int,
      priceFull: freezed == priceFull
          ? _value.priceFull
          : priceFull // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priceDeposit: freezed == priceDeposit
          ? _value.priceDeposit
          : priceDeposit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      participantsCount: null == participantsCount
          ? _value.participantsCount
          : participantsCount // ignore: cast_nullable_to_non_nullable
              as int,
      menCount: null == menCount
          ? _value.menCount
          : menCount // ignore: cast_nullable_to_non_nullable
              as int,
      womenCount: null == womenCount
          ? _value.womenCount
          : womenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isRegistered: null == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDtoImpl extends _EventDto {
  const _$EventDtoImpl(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(name: 'event_date') required this.date,
      @JsonKey(name: 'location_name') this.locationName,
      @JsonKey(name: 'location_address') this.locationAddress,
      @JsonKey(name: 'max_men') required this.maxMen,
      @JsonKey(name: 'max_women') required this.maxWomen,
      @JsonKey(name: 'price_full') required this.priceFull,
      @JsonKey(name: 'price_deposit') required this.priceDeposit,
      @JsonKey(name: 'media_url') this.mediaUrl,
      @JsonKey(name: 'participants_count') this.participantsCount = 0,
      @JsonKey(name: 'men_count') this.menCount = 0,
      @JsonKey(name: 'women_count') this.womenCount = 0,
      @JsonKey(name: 'is_registered') this.isRegistered = false,
      final List<dynamic> media = const []})
      : _media = media,
        super._();

  factory _$EventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'event_date')
  final DateTime date;
  @override
  @JsonKey(name: 'location_name')
  final String? locationName;
  @override
  @JsonKey(name: 'location_address')
  final String? locationAddress;
  @override
  @JsonKey(name: 'max_men')
  final int maxMen;
  @override
  @JsonKey(name: 'max_women')
  final int maxWomen;
  @override
  @JsonKey(name: 'price_full')
  final dynamic priceFull;
  @override
  @JsonKey(name: 'price_deposit')
  final dynamic priceDeposit;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'participants_count')
  final int participantsCount;
  @override
  @JsonKey(name: 'men_count')
  final int menCount;
  @override
  @JsonKey(name: 'women_count')
  final int womenCount;
  @override
  @JsonKey(name: 'is_registered')
  final bool isRegistered;
// Map list of media objects to URL list, handled in toDomain or via custom converter
// For simplicity, backend sends 'media' array, we can map it here.
// However, if backend sends objects, we need a custom converter or just ignore and map in toDomain.
// Let's assume generic map for now or ignore and rely on toDomain parsing if complex.
// Actually, backend sends `media: [{id, url, ...}]`. better to handle as List<dynamic> and map.
  final List<dynamic> _media;
// Map list of media objects to URL list, handled in toDomain or via custom converter
// For simplicity, backend sends 'media' array, we can map it here.
// However, if backend sends objects, we need a custom converter or just ignore and map in toDomain.
// Let's assume generic map for now or ignore and rely on toDomain parsing if complex.
// Actually, backend sends `media: [{id, url, ...}]`. better to handle as List<dynamic> and map.
  @override
  @JsonKey()
  List<dynamic> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  String toString() {
    return 'EventDto(id: $id, name: $name, description: $description, date: $date, locationName: $locationName, locationAddress: $locationAddress, maxMen: $maxMen, maxWomen: $maxWomen, priceFull: $priceFull, priceDeposit: $priceDeposit, mediaUrl: $mediaUrl, participantsCount: $participantsCount, menCount: $menCount, womenCount: $womenCount, isRegistered: $isRegistered, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.locationAddress, locationAddress) ||
                other.locationAddress == locationAddress) &&
            (identical(other.maxMen, maxMen) || other.maxMen == maxMen) &&
            (identical(other.maxWomen, maxWomen) ||
                other.maxWomen == maxWomen) &&
            const DeepCollectionEquality().equals(other.priceFull, priceFull) &&
            const DeepCollectionEquality()
                .equals(other.priceDeposit, priceDeposit) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.participantsCount, participantsCount) ||
                other.participantsCount == participantsCount) &&
            (identical(other.menCount, menCount) ||
                other.menCount == menCount) &&
            (identical(other.womenCount, womenCount) ||
                other.womenCount == womenCount) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered) &&
            const DeepCollectionEquality().equals(other._media, _media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      date,
      locationName,
      locationAddress,
      maxMen,
      maxWomen,
      const DeepCollectionEquality().hash(priceFull),
      const DeepCollectionEquality().hash(priceDeposit),
      mediaUrl,
      participantsCount,
      menCount,
      womenCount,
      isRegistered,
      const DeepCollectionEquality().hash(_media));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      __$$EventDtoImplCopyWithImpl<_$EventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDtoImplToJson(
      this,
    );
  }
}

abstract class _EventDto extends EventDto {
  const factory _EventDto(
      {required final String id,
      required final String name,
      final String? description,
      @JsonKey(name: 'event_date') required final DateTime date,
      @JsonKey(name: 'location_name') final String? locationName,
      @JsonKey(name: 'location_address') final String? locationAddress,
      @JsonKey(name: 'max_men') required final int maxMen,
      @JsonKey(name: 'max_women') required final int maxWomen,
      @JsonKey(name: 'price_full') required final dynamic priceFull,
      @JsonKey(name: 'price_deposit') required final dynamic priceDeposit,
      @JsonKey(name: 'media_url') final String? mediaUrl,
      @JsonKey(name: 'participants_count') final int participantsCount,
      @JsonKey(name: 'men_count') final int menCount,
      @JsonKey(name: 'women_count') final int womenCount,
      @JsonKey(name: 'is_registered') final bool isRegistered,
      final List<dynamic> media}) = _$EventDtoImpl;
  const _EventDto._() : super._();

  factory _EventDto.fromJson(Map<String, dynamic> json) =
      _$EventDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'event_date')
  DateTime get date;
  @override
  @JsonKey(name: 'location_name')
  String? get locationName;
  @override
  @JsonKey(name: 'location_address')
  String? get locationAddress;
  @override
  @JsonKey(name: 'max_men')
  int get maxMen;
  @override
  @JsonKey(name: 'max_women')
  int get maxWomen;
  @override
  @JsonKey(name: 'price_full')
  dynamic get priceFull;
  @override
  @JsonKey(name: 'price_deposit')
  dynamic get priceDeposit;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'participants_count')
  int get participantsCount;
  @override
  @JsonKey(name: 'men_count')
  int get menCount;
  @override
  @JsonKey(name: 'women_count')
  int get womenCount;
  @override
  @JsonKey(name: 'is_registered')
  bool get isRegistered;
  @override // Map list of media objects to URL list, handled in toDomain or via custom converter
// For simplicity, backend sends 'media' array, we can map it here.
// However, if backend sends objects, we need a custom converter or just ignore and map in toDomain.
// Let's assume generic map for now or ignore and rely on toDomain parsing if complex.
// Actually, backend sends `media: [{id, url, ...}]`. better to handle as List<dynamic> and map.
  List<dynamic> get media;
  @override
  @JsonKey(ignore: true)
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
