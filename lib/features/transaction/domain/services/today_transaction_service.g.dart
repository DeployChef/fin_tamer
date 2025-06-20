// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todayTransactionServiceHash() =>
    r'0ab5a8c2ce02f6f678447bf2831ed261ff85d5d2';

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

abstract class _$TodayTransactionService
    extends BuildlessAutoDisposeAsyncNotifier<List<TransactionResponse>> {
  late final bool isIncome;

  FutureOr<List<TransactionResponse>> build({
    required bool isIncome,
  });
}

/// See also [TodayTransactionService].
@ProviderFor(TodayTransactionService)
const todayTransactionServiceProvider = TodayTransactionServiceFamily();

/// See also [TodayTransactionService].
class TodayTransactionServiceFamily
    extends Family<AsyncValue<List<TransactionResponse>>> {
  /// See also [TodayTransactionService].
  const TodayTransactionServiceFamily();

  /// See also [TodayTransactionService].
  TodayTransactionServiceProvider call({
    required bool isIncome,
  }) {
    return TodayTransactionServiceProvider(
      isIncome: isIncome,
    );
  }

  @override
  TodayTransactionServiceProvider getProviderOverride(
    covariant TodayTransactionServiceProvider provider,
  ) {
    return call(
      isIncome: provider.isIncome,
    );
  }

  static final Iterable<ProviderOrFamily> _dependencies = <ProviderOrFamily>[
    accountServiceProvider
  ];

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static final Iterable<ProviderOrFamily> _allTransitiveDependencies =
      <ProviderOrFamily>{
    accountServiceProvider,
    ...?accountServiceProvider.allTransitiveDependencies
  };

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todayTransactionServiceProvider';
}

/// See also [TodayTransactionService].
class TodayTransactionServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TodayTransactionService,
        List<TransactionResponse>> {
  /// See also [TodayTransactionService].
  TodayTransactionServiceProvider({
    required bool isIncome,
  }) : this._internal(
          () => TodayTransactionService()..isIncome = isIncome,
          from: todayTransactionServiceProvider,
          name: r'todayTransactionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todayTransactionServiceHash,
          dependencies: TodayTransactionServiceFamily._dependencies,
          allTransitiveDependencies:
              TodayTransactionServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
        );

  TodayTransactionServiceProvider._internal(
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
    covariant TodayTransactionService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
    );
  }

  @override
  Override overrideWith(TodayTransactionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodayTransactionServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TodayTransactionService,
      List<TransactionResponse>> createElement() {
    return _TodayTransactionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodayTransactionServiceProvider &&
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
mixin TodayTransactionServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<TransactionResponse>> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _TodayTransactionServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TodayTransactionService,
        List<TransactionResponse>> with TodayTransactionServiceRef {
  _TodayTransactionServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as TodayTransactionServiceProvider).isIncome;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
