// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatHash() => r'e758ad652b0cf6f8d880185c7687946e8521e214';

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

abstract class _$Chat
    extends BuildlessAutoDisposeAsyncNotifier<List<ChatMessageEntity>> {
  late final String eventId;
  late final String otherId;

  FutureOr<List<ChatMessageEntity>> build(
    String eventId,
    String otherId,
  );
}

/// See also [Chat].
@ProviderFor(Chat)
const chatProvider = ChatFamily();

/// See also [Chat].
class ChatFamily extends Family<AsyncValue<List<ChatMessageEntity>>> {
  /// See also [Chat].
  const ChatFamily();

  /// See also [Chat].
  ChatProvider call(
    String eventId,
    String otherId,
  ) {
    return ChatProvider(
      eventId,
      otherId,
    );
  }

  @override
  ChatProvider getProviderOverride(
    covariant ChatProvider provider,
  ) {
    return call(
      provider.eventId,
      provider.otherId,
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
  String? get name => r'chatProvider';
}

/// See also [Chat].
class ChatProvider extends AutoDisposeAsyncNotifierProviderImpl<Chat,
    List<ChatMessageEntity>> {
  /// See also [Chat].
  ChatProvider(
    String eventId,
    String otherId,
  ) : this._internal(
          () => Chat()
            ..eventId = eventId
            ..otherId = otherId,
          from: chatProvider,
          name: r'chatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$chatHash,
          dependencies: ChatFamily._dependencies,
          allTransitiveDependencies: ChatFamily._allTransitiveDependencies,
          eventId: eventId,
          otherId: otherId,
        );

  ChatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
    required this.otherId,
  }) : super.internal();

  final String eventId;
  final String otherId;

  @override
  FutureOr<List<ChatMessageEntity>> runNotifierBuild(
    covariant Chat notifier,
  ) {
    return notifier.build(
      eventId,
      otherId,
    );
  }

  @override
  Override overrideWith(Chat Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatProvider._internal(
        () => create()
          ..eventId = eventId
          ..otherId = otherId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
        otherId: otherId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Chat, List<ChatMessageEntity>>
      createElement() {
    return _ChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatProvider &&
        other.eventId == eventId &&
        other.otherId == otherId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, otherId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatRef on AutoDisposeAsyncNotifierProviderRef<List<ChatMessageEntity>> {
  /// The parameter `eventId` of this provider.
  String get eventId;

  /// The parameter `otherId` of this provider.
  String get otherId;
}

class _ChatProviderElement extends AutoDisposeAsyncNotifierProviderElement<Chat,
    List<ChatMessageEntity>> with ChatRef {
  _ChatProviderElement(super.provider);

  @override
  String get eventId => (origin as ChatProvider).eventId;
  @override
  String get otherId => (origin as ChatProvider).otherId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
