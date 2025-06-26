// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_categories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredCategoriesHash() =>
    r'3454ed5133b666c3e96d237cfd87d9a2e0ee4f05';

/// See also [FilteredCategories].
@ProviderFor(FilteredCategories)
final filteredCategoriesProvider = AutoDisposeAsyncNotifierProvider<
    FilteredCategories, List<Category>>.internal(
  FilteredCategories.new,
  name: r'filteredCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredCategoriesHash,
  dependencies: <ProviderOrFamily>[categoriesServiceProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    categoriesServiceProvider,
    ...?categoriesServiceProvider.allTransitiveDependencies
  },
);

typedef _$FilteredCategories = AutoDisposeAsyncNotifier<List<Category>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
