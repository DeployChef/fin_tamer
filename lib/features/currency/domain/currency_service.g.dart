// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currencyServiceHash() => r'7e38b94c39e19b84539b5c7b639e50bc90ad498e';

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
