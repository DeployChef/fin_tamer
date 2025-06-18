// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionServiceHash() =>
    r'93408531e3420d72e67d3f1fd16baf4025ad2dd2';

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

abstract class _$TransactionService
    extends BuildlessAutoDisposeAsyncNotifier<List<TransactionResponse>> {
  late final bool isIncome;
  late final DateTime? startDate;
  late final DateTime? endDate;

  FutureOr<List<TransactionResponse>> build({
    required bool isIncome,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// See also [TransactionService].
@ProviderFor(TransactionService)
const transactionServiceProvider = TransactionServiceFamily();

/// See also [TransactionService].
class TransactionServiceFamily
    extends Family<AsyncValue<List<TransactionResponse>>> {
  /// See also [TransactionService].
  const TransactionServiceFamily();

  /// See also [TransactionService].
  TransactionServiceProvider call({
    required bool isIncome,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TransactionServiceProvider(
      isIncome: isIncome,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  TransactionServiceProvider getProviderOverride(
    covariant TransactionServiceProvider provider,
  ) {
    return call(
      isIncome: provider.isIncome,
      startDate: provider.startDate,
      endDate: provider.endDate,
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
  String? get name => r'transactionServiceProvider';
}

/// See also [TransactionService].
class TransactionServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TransactionService, List<TransactionResponse>> {
  /// See also [TransactionService].
  TransactionServiceProvider({
    required bool isIncome,
    DateTime? startDate,
    DateTime? endDate,
  }) : this._internal(
          () => TransactionService()
            ..isIncome = isIncome
            ..startDate = startDate
            ..endDate = endDate,
          from: transactionServiceProvider,
          name: r'transactionServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionServiceHash,
          dependencies: TransactionServiceFamily._dependencies,
          allTransitiveDependencies:
              TransactionServiceFamily._allTransitiveDependencies,
          isIncome: isIncome,
          startDate: startDate,
          endDate: endDate,
        );

  TransactionServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isIncome,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final bool isIncome;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  FutureOr<List<TransactionResponse>> runNotifierBuild(
    covariant TransactionService notifier,
  ) {
    return notifier.build(
      isIncome: isIncome,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Override overrideWith(TransactionService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionServiceProvider._internal(
        () => create()
          ..isIncome = isIncome
          ..startDate = startDate
          ..endDate = endDate,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isIncome: isIncome,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TransactionService,
      List<TransactionResponse>> createElement() {
    return _TransactionServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionServiceProvider &&
        other.isIncome == isIncome &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isIncome.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionServiceRef
    on AutoDisposeAsyncNotifierProviderRef<List<TransactionResponse>> {
  /// The parameter `isIncome` of this provider.
  bool get isIncome;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _TransactionServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TransactionService,
        List<TransactionResponse>> with TransactionServiceRef {
  _TransactionServiceProviderElement(super.provider);

  @override
  bool get isIncome => (origin as TransactionServiceProvider).isIncome;
  @override
  DateTime? get startDate => (origin as TransactionServiceProvider).startDate;
  @override
  DateTime? get endDate => (origin as TransactionServiceProvider).endDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
