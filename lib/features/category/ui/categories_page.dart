import 'package:fin_tamer/core/l10n/app_localizations.dart';
import 'package:fin_tamer/features/category/domain/services/filtered_categories.dart';
import 'package:fin_tamer/features/category/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.categoriesTitle),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => ref.read(filteredCategoriesProvider.notifier).setFilter(value),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xffECE6F0),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              hintText: "Найти статью",
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xff1D1B20),
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          const Divider(),
          Expanded(
            child: ref.watch(filteredCategoriesProvider).when(
                  data: (categories) {
                    return categories.isEmpty
                        ? Center(child: Text(loc.notFound))
                        : ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final item = categories[index];
                              return Column(
                                children: [
                                  CategoryItem(item: item),
                                  const Divider(),
                                ],
                              );
                            },
                          );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => const Center(child: Text("Error")),
                ),
          ),
        ],
      ),
    );
  }
}
