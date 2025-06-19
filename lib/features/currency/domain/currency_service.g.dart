// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyServiceHash() => r'550648c7dfcc21d180d151e9e7a53c467efb0d29';

/// See also [CurrencyService].
@ProviderFor(CurrencyService)
final currencyServiceProvider =
    AsyncNotifierProvider<CurrencyService, Currency>.internal(
  CurrencyService.new,
  name: r'currencyServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencyServiceHash,
  dependencies: <ProviderOrFamily>[accountServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    accountServiceProvider,
    ...?accountServiceProvider.allTransitiveDependencies
  },
);

typedef _$CurrencyService = AsyncNotifier<Currency>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
