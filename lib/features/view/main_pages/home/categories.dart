import 'package:flutter/material.dart';
import '../../../../core/widgets/gridview_allItems.dart';

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
          children: [
            GridViewOfItems(
              category: category,
            )
          ],
        ));
  }
}
