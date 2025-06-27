// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_filtered_transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyFilteredTransactionServiceHash() =>
    r'f60827f0e7458b05ccfda2b2ca038960919b74eb';

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

abstract class _$HistoryFilteredTransactionService
    extends BuildlessAutoDisposeAsyncNotifier<List<Transaction>> {
  late final bool isIncome;

  FutureOr<List<Transaction>> build({
    required bool isIncome,
  });
}

/// See also [HistoryFilteredTransactionService].
@ProviderFor(HistoryFilteredTransactionService)
const historyFilteredTransactionServiceProvider =
    HistoryFilteredTransactionServiceFamily();

/// See also [HistoryFilteredTransactionService].
class HistoryFilteredTransactionServiceFamily
    extends Family<AsyncValue<List<Transaction>>> {
  /// See also [HistoryFilteredTransactionService].
  const HistoryFilteredTransactionServiceFamily();

  /// See also [HistoryFilteredTransactionService].
  HistoryFilteredTransactionServiceProvider call({
    required bool isIncome,
  }) {
    return HistoryFilteredTransactionServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  HistoryFilteredTransactionServiceProvider getProviderOverride(
    covariant HistoryFilteredTransactionServiceProvider provider,
  ) {
    return call(
      isIncome: provider.isIncome,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    accountServiceProvider,
    historyFilterServiceProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    accountServiceProvider,
    ...?accountServiceProvider.allTransitiveDependencies,
    historyFilterServiceProvider,
    ...?historyFilterServiceProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'historyFilteredTransactionServiceProvider';
}

/// See also [HistoryFilteredTransactionService].
class HistoryFilteredTransactionServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        HistoryFilteredTransactionService, List<Transaction>> {
  /// See also [HistoryFilteredTransactionService].
  HistoryFilteredTransactionServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => HistoryFilteredTransactionService()..isIncome = isIncome,
          from: historyFilteredTransactionServiceProvider,
          name: r'historyFilteredTransactionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$historyFilteredTransactionServiceHash,
          dependencies: HistoryFilteredTransactionServiceFamily._dependencies,
          allTransitiveDependencies: HistoryFilteredTransactionServiceFamily
              ._allTransitiveDependencies,
          isIncome: isIncome,
        );

  HistoryFilteredTransactionServiceProvider._internal(
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
  FutureOr<List<Transaction>> runNotifierBuild(
    covariant HistoryFilteredTransactionService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(HistoryFilteredTransactionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: HistoryFilteredTransactionServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<HistoryFilteredTransactionService,
      List<Transaction>> createElement() {
    return _HistoryFilteredTransactionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryFilteredTransactionServiceProvider &&
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
mixin HistoryFilteredTransactionServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<Transaction>> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _HistoryFilteredTransactionServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        HistoryFilteredTransactionService,
        List<Transaction>> with HistoryFilteredTransactionServiceRef {
  _HistoryFilteredTransactionServiceProviderElement(super.provider);

  @override
  bool get isIncome =>
      (origin as HistoryFilteredTransactionServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
