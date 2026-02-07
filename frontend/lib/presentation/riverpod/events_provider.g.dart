// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventDetailsHash() => r'820347dd3a21159a05b5a1be15e205f0e870e9e9';

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

/// See also [eventDetails].
@ProviderFor(eventDetails)
const eventDetailsProvider = EventDetailsFamily();

/// See also [eventDetails].
class EventDetailsFamily extends Family<AsyncValue<EventEntity>> {
  /// See also [eventDetails].
  const EventDetailsFamily();

  /// See also [eventDetails].
  EventDetailsProvider call(String id) {
    return EventDetailsProvider(id);
  }

  @override
  EventDetailsProvider getProviderOverride(
    covariant EventDetailsProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'eventDetailsProvider';
}

/// See also [eventDetails].
class EventDetailsProvider extends AutoDisposeFutureProvider<EventEntity> {
  /// See also [eventDetails].
  EventDetailsProvider(String id)
    : this._internal(
        (ref) => eventDetails(ref as EventDetailsRef, id),
        from: eventDetailsProvider,
        name: r'eventDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$eventDetailsHash,
        dependencies: EventDetailsFamily._dependencies,
        allTransitiveDependencies:
            EventDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  EventDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<EventEntity> Function(EventDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventDetailsProvider._internal(
        (ref) => create(ref as EventDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EventEntity> createElement() {
    return _EventDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EventDetailsRef on AutoDisposeFutureProviderRef<EventEntity> {
  /// The parameter `id` of this provider.
  String get id;
}

class _EventDetailsProviderElement
    extends AutoDisposeFutureProviderElement<EventEntity>
    with EventDetailsRef {
  _EventDetailsProviderElement(super.provider);

  @override
  String get id => (origin as EventDetailsProvider).id;
}

String _$eventsHash() => r'927d65a11ac52098cf35bc388e39d7d2d1bc9bec';

/// See also [Events].
@ProviderFor(Events)
final eventsProvider =
    AutoDisposeAsyncNotifierProvider<Events, List<EventEntity>>.internal(
      Events.new,
      name: r'eventsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$eventsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Events = AutoDisposeAsyncNotifier<List<EventEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
