import 'package:fin_tamer/features/category/domain/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.item});

  final Category item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: const Color(0xFFD4FAE6),
        child: Text(
          item.emoji,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      title: Text(
        item.name,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
