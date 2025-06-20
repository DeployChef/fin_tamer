// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filter_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyFilterServiceHash() =>
    r'66f4b49d19f9c6993641a2e148539ad7c6e58428';

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

abstract class _$HistoryFilterService
    extends BuildlessAutoDisposeNotifier<HistoryFilterStateModel> {
  late final bool isIncome;

  HistoryFilterStateModel build({
    required bool isIncome,
  });
}

/// See also [HistoryFilterService].
@ProviderFor(HistoryFilterService)
const historyFilterServiceProvider = HistoryFilterServiceFamily();

/// See also [HistoryFilterService].
class HistoryFilterServiceFamily extends Family<HistoryFilterStateModel> {
  /// See also [HistoryFilterService].
  const HistoryFilterServiceFamily();

  /// See also [HistoryFilterService].
  HistoryFilterServiceProvider call({
    required bool isIncome,
  }) {
    return HistoryFilterServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  HistoryFilterServiceProvider getProviderOverride(
    covariant HistoryFilterServiceProvider provider,
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
  String? get name => r'historyFilterServiceProvider';
}

/// See also [HistoryFilterService].
class HistoryFilterServiceProvider extends AutoDisposeNotifierProviderImpl<
    HistoryFilterService, HistoryFilterStateModel> {
  /// See also [HistoryFilterService].
  HistoryFilterServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => HistoryFilterService()..isIncome = isIncome,
          from: historyFilterServiceProvider,
          name: r'historyFilterServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$historyFilterServiceHash,
          dependencies: HistoryFilterServiceFamily._dependencies,
          allTransitiveDependencies:
              HistoryFilterServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
        );

  HistoryFilterServiceProvider._internal(
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
  HistoryFilterStateModel runNotifierBuild(
    covariant HistoryFilterService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(HistoryFilterService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HistoryFilterServiceProvider._internal(
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
  AutoDisposeNotifierProviderElement<HistoryFilterService,
      HistoryFilterStateModel> createElement() {
    return _HistoryFilterServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryFilterServiceProvider && other.isIncome == isIncome;
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
mixin HistoryFilterServiceRef
    on AutoDisposeNotifierProviderRef<HistoryFilterStateModel> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _HistoryFilterServiceProviderElement
    extends AutoDisposeNotifierProviderElement<HistoryFilterService,
        HistoryFilterStateModel> with HistoryFilterServiceRef {
  _HistoryFilterServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as HistoryFilterServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
