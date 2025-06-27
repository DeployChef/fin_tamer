// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_filter_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analyticsFilterServiceHash() =>
    r'68c491158d8b1f42a2e39283e5154f0f2e67b3a4';

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

abstract class _$AnalyticsFilterService
    extends BuildlessAutoDisposeNotifier<AnalyticsFilterStateModel> {
  late final bool isIncome;

  AnalyticsFilterStateModel build({
    required bool isIncome,
  });
}

/// See also [AnalyticsFilterService].
@ProviderFor(AnalyticsFilterService)
const analyticsFilterServiceProvider = AnalyticsFilterServiceFamily();

/// See also [AnalyticsFilterService].
class AnalyticsFilterServiceFamily extends Family<AnalyticsFilterStateModel> {
  /// See also [AnalyticsFilterService].
  const AnalyticsFilterServiceFamily();

  /// See also [AnalyticsFilterService].
  AnalyticsFilterServiceProvider call({
    required bool isIncome,
  }) {
    return AnalyticsFilterServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  AnalyticsFilterServiceProvider getProviderOverride(
    covariant AnalyticsFilterServiceProvider provider,
  ) {
    return call(
      isIncome: provider.isIncome,
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
  String? get name => r'analyticsFilterServiceProvider';
}

/// See also [AnalyticsFilterService].
class AnalyticsFilterServiceProvider extends AutoDisposeNotifierProviderImpl<
    AnalyticsFilterService, AnalyticsFilterStateModel> {
  /// See also [AnalyticsFilterService].
  AnalyticsFilterServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => AnalyticsFilterService()..isIncome = isIncome,
          from: analyticsFilterServiceProvider,
          name: r'analyticsFilterServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analyticsFilterServiceHash,
          dependencies: AnalyticsFilterServiceFamily._dependencies,
          allTransitiveDependencies:
              AnalyticsFilterServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
        );

  AnalyticsFilterServiceProvider._internal(
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
  AnalyticsFilterStateModel runNotifierBuild(
    covariant AnalyticsFilterService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(AnalyticsFilterService Function() create) {
    return ProviderOverride(
      origin: this,
      override: AnalyticsFilterServiceProvider._internal(
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
  AutoDisposeNotifierProviderElement<AnalyticsFilterService,
      AnalyticsFilterStateModel> createElement() {
    return _AnalyticsFilterServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalyticsFilterServiceProvider &&
        other.isIncome == isIncome;
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
mixin AnalyticsFilterServiceRef
    on AutoDisposeNotifierProviderRef<AnalyticsFilterStateModel> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _AnalyticsFilterServiceProviderElement
    extends AutoDisposeNotifierProviderElement<AnalyticsFilterService,
        AnalyticsFilterStateModel> with AnalyticsFilterServiceRef {
  _AnalyticsFilterServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as AnalyticsFilterServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
