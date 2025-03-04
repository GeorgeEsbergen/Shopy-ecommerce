// ignore_for_file: must_be_immutable
import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/list_of_all_items.dart';
import '../../../../core/widgets/search_text_field.dart';
import 'search.dart';
import 'widgets/categoris_list.dart';

class HomeBody extends StatefulWidget {
  HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchTextField(
          controller: search,
          icon: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(
                        query: search.text,
                      )));
              search.clear();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/discount.png',
          width: double.infinity,
          height: 150,
        ),
        const SizedBox(height: 20),
        const Text('Categories'),
        const CategoriesList(),
        const SizedBox(height: 20),
        const Text('Recently Produced'),
        const ListOfItems(),
      ],
    );
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
