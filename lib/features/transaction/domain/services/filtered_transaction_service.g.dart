// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTransactionServiceHash() =>
    r'cc6e67b11f713080baed4ffd368ac3b3505c3145';

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

abstract class _$FilteredTransactionService
    extends BuildlessAutoDisposeAsyncNotifier<List<TransactionResponse>> {
  late final bool isIncome;

  FutureOr<List<TransactionResponse>> build({
    required bool isIncome,
  });
}

/// See also [FilteredTransactionService].
@ProviderFor(FilteredTransactionService)
const filteredTransactionServiceProvider = FilteredTransactionServiceFamily();

/// See also [FilteredTransactionService].
class FilteredTransactionServiceFamily
    extends Family<AsyncValue<List<TransactionResponse>>> {
  /// See also [FilteredTransactionService].
  const FilteredTransactionServiceFamily();

  /// See also [FilteredTransactionService].
  FilteredTransactionServiceProvider call({
    required bool isIncome,
  }) {
    return FilteredTransactionServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  FilteredTransactionServiceProvider getProviderOverride(
    covariant FilteredTransactionServiceProvider provider,
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
  String? get name => r'filteredTransactionServiceProvider';
}

/// See also [FilteredTransactionService].
class FilteredTransactionServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredTransactionService,
        List<TransactionResponse>> {
  /// See also [FilteredTransactionService].
  FilteredTransactionServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => FilteredTransactionService()..isIncome = isIncome,
          from: filteredTransactionServiceProvider,
          name: r'filteredTransactionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredTransactionServiceHash,
          dependencies: FilteredTransactionServiceFamily._dependencies,
          allTransitiveDependencies:
              FilteredTransactionServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
        );

  FilteredTransactionServiceProvider._internal(
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
  FutureOr<List<TransactionResponse>> runNotifierBuild(
    covariant FilteredTransactionService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(FilteredTransactionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredTransactionServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredTransactionService,
      List<TransactionResponse>> createElement() {
    return _FilteredTransactionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTransactionServiceProvider &&
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
mixin FilteredTransactionServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<TransactionResponse>> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _FilteredTransactionServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredTransactionService,
        List<TransactionResponse>> with FilteredTransactionServiceRef {
  _FilteredTransactionServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as FilteredTransactionServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
