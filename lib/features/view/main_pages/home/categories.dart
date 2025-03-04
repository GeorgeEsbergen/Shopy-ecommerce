import 'package:e_commerce_with_supabase/core/widgets/item_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/list_of_all_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category),
          centerTitle: true,
        ),
        body: ListView(
          children: [ListOfItems(category: category,)],
        ));
  }
}
