// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsServiceHash() => r'31cb13619d44e6610a189f353dd9b1f81df64a4d';

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

abstract class _$AnalyticsService
    extends BuildlessAutoDisposeAsyncNotifier<List<AnalyticsState>> {
  late final bool isIncome;

  FutureOr<List<AnalyticsState>> build({
    required bool isIncome,
  });
}

/// See also [AnalyticsService].
@ProviderFor(AnalyticsService)
const analyticsServiceProvider = AnalyticsServiceFamily();

/// See also [AnalyticsService].
class AnalyticsServiceFamily extends Family<AsyncValue<List<AnalyticsState>>> {
  /// See also [AnalyticsService].
  const AnalyticsServiceFamily();

  /// See also [AnalyticsService].
  AnalyticsServiceProvider call({
    required bool isIncome,
  }) {
    return AnalyticsServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  AnalyticsServiceProvider getProviderOverride(
    covariant AnalyticsServiceProvider provider,
  ) {
    return call(
      isIncome: provider.isIncome,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    accountServiceProvider,
    analyticsFilterServiceProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    accountServiceProvider,
    ...?accountServiceProvider.allTransitiveDependencies,
    analyticsFilterServiceProvider,
    ...?analyticsFilterServiceProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'analyticsServiceProvider';
}

/// See also [AnalyticsService].
class AnalyticsServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AnalyticsService, List<AnalyticsState>> {
  /// See also [AnalyticsService].
  AnalyticsServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => AnalyticsService()..isIncome = isIncome,
          from: analyticsServiceProvider,
          name: r'analyticsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analyticsServiceHash,
          dependencies: AnalyticsServiceFamily._dependencies,
          allTransitiveDependencies:
              AnalyticsServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
        );

  AnalyticsServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isIncome,
  }) : super.internal();

  final bool isIncome;

  @override
  FutureOr<List<AnalyticsState>> runNotifierBuild(
    covariant AnalyticsService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(AnalyticsService Function() create) {
    return ProviderOverride(
      origin: this,
      override: AnalyticsServiceProvider._internal(
        () => create()..isIncome = isIncome,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isIncome: isIncome,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AnalyticsService,
      List<AnalyticsState>> createElement() {
    return _AnalyticsServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalyticsServiceProvider && other.isIncome == isIncome;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isIncome.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnalyticsServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<AnalyticsState>> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _AnalyticsServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AnalyticsService,
        List<AnalyticsState>> with AnalyticsServiceRef {
  _AnalyticsServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as AnalyticsServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
