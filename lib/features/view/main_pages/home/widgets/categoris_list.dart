import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../categories.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: fun(context).map((category) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoriesScreen(category: category.name),
              ));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.gray.withOpacity(0.3),
                  foregroundColor: AppColors.black,
                  child: Icon(category.icon),
                ),
                const SizedBox(height: 5),
                Text(category.showName),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

List<Category> fun(BuildContext context) {
  List<Category> allCategories = [
    Category(icon: Icons.sports, name: 'sports', showName: 'sports'.tr(context) ),
    Category(icon: Icons.laptop_chromebook, name: 'electronics', showName: 'electronics'.tr(context) ,),
    Category(icon: Icons.collections, name: 'collections', showName: 'collections'.tr(context)),
    Category(icon: Icons.book, name: 'books', showName: 'books'.tr(context)),
    Category(icon: Icons.games, name: 'games', showName: 'games'.tr(context),),
  ];

  return allCategories;
}

class Category {
  final IconData icon;
  final String name;
  final String showName;
  

  Category( {required this.showName,required this.icon, required this.name});
}
