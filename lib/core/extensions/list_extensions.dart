import 'package:fuzzywuzzy/fuzzywuzzy.dart';

extension ListExtension<T> on List<T> {
  List<T> fuzzySearch(String search, String Function(T) getSearchingValue) {
    if (search.isEmpty) return this;

    final fuzzy = extractAllSorted(
      query: search,
      choices: map(getSearchingValue).toList(),
      cutoff: 50,
    );

    final result = fuzzy.map((c) => c.choice).toList();
    return where((c) => result.contains(getSearchingValue(c))).toList();
  }
}
