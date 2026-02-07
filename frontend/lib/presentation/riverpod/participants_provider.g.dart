// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$participantsHash() => r'44b0c023a25bd571e335003d3be400cc27bc772d';

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

/// See also [participants].
@ProviderFor(participants)
const participantsProvider = ParticipantsFamily();

/// See also [participants].
class ParticipantsFamily extends Family<AsyncValue<List<ParticipantEntity>>> {
  /// See also [participants].
  const ParticipantsFamily();

  /// See also [participants].
  ParticipantsProvider call(String eventId) {
    return ParticipantsProvider(eventId);
  }

  @override
  ParticipantsProvider getProviderOverride(
    covariant ParticipantsProvider provider,
  ) {
    return call(provider.eventId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'participantsProvider';
}

/// See also [participants].
class ParticipantsProvider
    extends AutoDisposeFutureProvider<List<ParticipantEntity>> {
  /// See also [participants].
  ParticipantsProvider(String eventId)
    : this._internal(
        (ref) => participants(ref as ParticipantsRef, eventId),
        from: participantsProvider,
        name: r'participantsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$participantsHash,
        dependencies: ParticipantsFamily._dependencies,
        allTransitiveDependencies:
            ParticipantsFamily._allTransitiveDependencies,
        eventId: eventId,
      );

  ParticipantsProvider._internal(
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
    FutureOr<List<ParticipantEntity>> Function(ParticipantsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParticipantsProvider._internal(
        (ref) => create(ref as ParticipantsRef),
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
    return _ParticipantsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParticipantsProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParticipantsRef on AutoDisposeFutureProviderRef<List<ParticipantEntity>> {
  /// The parameter `eventId` of this provider.
  String get eventId;
}

class _ParticipantsProviderElement
    extends AutoDisposeFutureProviderElement<List<ParticipantEntity>>
    with ParticipantsRef {
  _ParticipantsProviderElement(super.provider);

  @override
  String get eventId => (origin as ParticipantsProvider).eventId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
