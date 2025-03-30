import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../categories.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoriesScreen(
                      category: allCategories[index].name,
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.black,
                  foregroundColor: AppColors.white,
                  child: Icon(allCategories[index].icon),
                ),
                const SizedBox(height: 5),
                Text(allCategories[index].name)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Category> allCategories = [
  Category(icon: Icons.sports, name: 'sports'),
  Category(icon: Icons.laptop_chromebook, name: 'electronics'),
  Category(icon: Icons.collections, name: 'collections'),
  Category(icon: Icons.book, name: 'books'),
  Category(icon: Icons.games, name: 'games'),
  Category(icon: Icons.bike_scooter, name: 'bike'),
];

class Category {
  final IconData icon;
  final String name;

  Category({required this.icon, required this.name});
}
