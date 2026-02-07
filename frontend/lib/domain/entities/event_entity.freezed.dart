// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return _EventEntity.fromJson(json);
}

/// @nodoc
mixin _$EventEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get maxMen => throw _privateConstructorUsedError;
  int get maxWomen => throw _privateConstructorUsedError;
  double get priceFull => throw _privateConstructorUsedError;
  double get priceDeposit => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;

  /// Serializes this EventEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventEntityCopyWith<EventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
    EventEntity value,
    $Res Function(EventEntity) then,
  ) = _$EventEntityCopyWithImpl<$Res, EventEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    DateTime date,
    String location,
    int maxMen,
    int maxWomen,
    double priceFull,
    double priceDeposit,
    String? mediaUrl,
  });
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res, $Val extends EventEntity>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? date = null,
    Object? location = null,
    Object? maxMen = null,
    Object? maxWomen = null,
    Object? priceFull = null,
    Object? priceDeposit = null,
    Object? mediaUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            maxMen: null == maxMen
                ? _value.maxMen
                : maxMen // ignore: cast_nullable_to_non_nullable
                      as int,
            maxWomen: null == maxWomen
                ? _value.maxWomen
                : maxWomen // ignore: cast_nullable_to_non_nullable
                      as int,
            priceFull: null == priceFull
                ? _value.priceFull
                : priceFull // ignore: cast_nullable_to_non_nullable
                      as double,
            priceDeposit: null == priceDeposit
                ? _value.priceDeposit
                : priceDeposit // ignore: cast_nullable_to_non_nullable
                      as double,
            mediaUrl: freezed == mediaUrl
                ? _value.mediaUrl
                : mediaUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventEntityImplCopyWith<$Res>
    implements $EventEntityCopyWith<$Res> {
  factory _$$EventEntityImplCopyWith(
    _$EventEntityImpl value,
    $Res Function(_$EventEntityImpl) then,
  ) = __$$EventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    DateTime date,
    String location,
    int maxMen,
    int maxWomen,
    double priceFull,
    double priceDeposit,
    String? mediaUrl,
  });
}

/// @nodoc
class __$$EventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$EventEntityImpl>
    implements _$$EventEntityImplCopyWith<$Res> {
  __$$EventEntityImplCopyWithImpl(
    _$EventEntityImpl _value,
    $Res Function(_$EventEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? date = null,
    Object? location = null,
    Object? maxMen = null,
    Object? maxWomen = null,
    Object? priceFull = null,
    Object? priceDeposit = null,
    Object? mediaUrl = freezed,
  }) {
    return _then(
      _$EventEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        maxMen: null == maxMen
            ? _value.maxMen
            : maxMen // ignore: cast_nullable_to_non_nullable
                  as int,
        maxWomen: null == maxWomen
            ? _value.maxWomen
            : maxWomen // ignore: cast_nullable_to_non_nullable
                  as int,
        priceFull: null == priceFull
            ? _value.priceFull
            : priceFull // ignore: cast_nullable_to_non_nullable
                  as double,
        priceDeposit: null == priceDeposit
            ? _value.priceDeposit
            : priceDeposit // ignore: cast_nullable_to_non_nullable
                  as double,
        mediaUrl: freezed == mediaUrl
            ? _value.mediaUrl
            : mediaUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventEntityImpl implements _EventEntity {
  const _$EventEntityImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.maxMen,
    required this.maxWomen,
    required this.priceFull,
    required this.priceDeposit,
    this.mediaUrl,
  });

  factory _$EventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final String location;
  @override
  final int maxMen;
  @override
  final int maxWomen;
  @override
  final double priceFull;
  @override
  final double priceDeposit;
  @override
  final String? mediaUrl;

  @override
  String toString() {
    return 'EventEntity(id: $id, name: $name, description: $description, date: $date, location: $location, maxMen: $maxMen, maxWomen: $maxWomen, priceFull: $priceFull, priceDeposit: $priceDeposit, mediaUrl: $mediaUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.maxMen, maxMen) || other.maxMen == maxMen) &&
            (identical(other.maxWomen, maxWomen) ||
                other.maxWomen == maxWomen) &&
            (identical(other.priceFull, priceFull) ||
                other.priceFull == priceFull) &&
            (identical(other.priceDeposit, priceDeposit) ||
                other.priceDeposit == priceDeposit) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    date,
    location,
    maxMen,
    maxWomen,
    priceFull,
    priceDeposit,
    mediaUrl,
  );

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      __$$EventEntityImplCopyWithImpl<_$EventEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityImplToJson(this);
  }
}

abstract class _EventEntity implements EventEntity {
  const factory _EventEntity({
    required final String id,
    required final String name,
    required final String description,
    required final DateTime date,
    required final String location,
    required final int maxMen,
    required final int maxWomen,
    required final double priceFull,
    required final double priceDeposit,
    final String? mediaUrl,
  }) = _$EventEntityImpl;

  factory _EventEntity.fromJson(Map<String, dynamic> json) =
      _$EventEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  String get location;
  @override
  int get maxMen;
  @override
  int get maxWomen;
  @override
  double get priceFull;
  @override
  double get priceDeposit;
  @override
  String? get mediaUrl;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
