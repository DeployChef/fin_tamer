// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyServiceHash() => r'a813eb17381c5fc0ae0a4dd2851fb8f631f729f2';

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

abstract class _$HistoryService
    extends BuildlessAutoDisposeAsyncNotifier<AccountHistoryFeed?> {
  late final int id;

  FutureOr<AccountHistoryFeed?> build(
    int id,
  );
}

/// See also [HistoryService].
@ProviderFor(HistoryService)
const historyServiceProvider = HistoryServiceFamily();

/// See also [HistoryService].
class HistoryServiceFamily extends Family<AsyncValue<AccountHistoryFeed?>> {
  /// See also [HistoryService].
  const HistoryServiceFamily();

  /// See also [HistoryService].
  HistoryServiceProvider call(
    int id,
  ) {
    return HistoryServiceProvider(
      id,
    );
  }

  @override
  HistoryServiceProvider getProviderOverride(
    covariant HistoryServiceProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'historyServiceProvider';
}

/// See also [HistoryService].
class HistoryServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    HistoryService, AccountHistoryFeed?> {
  /// See also [HistoryService].
  HistoryServiceProvider(
    int id,
  ) : this._internal(
          () => HistoryService()..id = id,
          from: historyServiceProvider,
          name: r'historyServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$historyServiceHash,
          dependencies: HistoryServiceFamily._dependencies,
          allTransitiveDependencies:
              HistoryServiceFamily._allTransitiveDependencies,
          id: id,
        );

  HistoryServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<AccountHistoryFeed?> runNotifierBuild(
    covariant HistoryService notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(HistoryService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HistoryServiceProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<HistoryService, AccountHistoryFeed?>
      createElement() {
    return _HistoryServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryServiceProvider && other.id == id;
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
mixin HistoryServiceRef
    on AutoDisposeAsyncNotifierProviderRef<AccountHistoryFeed?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _HistoryServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HistoryService,
        AccountHistoryFeed?> with HistoryServiceRef {
  _HistoryServiceProviderElement(super.provider);

  @override
  int get id => (origin as HistoryServiceProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
