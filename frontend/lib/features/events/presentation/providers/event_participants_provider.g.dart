// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_participants_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventParticipantsHash() => r'efbf30ca62f7518455fcb20b1930869754b76fc5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [eventParticipants].
@ProviderFor(eventParticipants)
const eventParticipantsProvider = EventParticipantsFamily();

/// See also [eventParticipants].
class EventParticipantsFamily
    extends Family<AsyncValue<List<ParticipantEntity>>> {
  /// See also [eventParticipants].
  const EventParticipantsFamily();

  /// See also [eventParticipants].
  EventParticipantsProvider call(
    String eventId,
  ) {
    return EventParticipantsProvider(
      eventId,
    );
  }

  @override
  EventParticipantsProvider getProviderOverride(
    covariant EventParticipantsProvider provider,
  ) {
    return call(
      provider.eventId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'eventParticipantsProvider';
}

/// See also [eventParticipants].
class EventParticipantsProvider
    extends AutoDisposeFutureProvider<List<ParticipantEntity>> {
  /// See also [eventParticipants].
  EventParticipantsProvider(
    String eventId,
  ) : this._internal(
          (ref) => eventParticipants(
            ref as EventParticipantsRef,
            eventId,
          ),
          from: eventParticipantsProvider,
          name: r'eventParticipantsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventParticipantsHash,
          dependencies: EventParticipantsFamily._dependencies,
          allTransitiveDependencies:
              EventParticipantsFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  EventParticipantsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final String eventId;

  @override
  Override overrideWith(
    FutureOr<List<ParticipantEntity>> Function(EventParticipantsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventParticipantsProvider._internal(
        (ref) => create(ref as EventParticipantsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ParticipantEntity>> createElement() {
    return _EventParticipantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventParticipantsProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EventParticipantsRef
    on AutoDisposeFutureProviderRef<List<ParticipantEntity>> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _EventParticipantsProviderElement
    extends AutoDisposeFutureProviderElement<List<ParticipantEntity>>
    with EventParticipantsRef {
  _EventParticipantsProviderElement(super.provider);

  @override
  String get eventId => (origin as EventParticipantsProvider).eventId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
