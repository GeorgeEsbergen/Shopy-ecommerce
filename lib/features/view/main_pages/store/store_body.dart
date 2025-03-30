// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/list_of_all_items.dart';
import '../../../../core/widgets/search_text_field.dart';
import '../home/search.dart';

class StoreBody extends StatelessWidget {
  StoreBody({super.key});
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            'Store'.tr(context),
            style: AppFonts.b20_600,
          ),
        ),
        const SizedBox(height: 20),
        SearchTextField(
          controller: search,
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchScreen(
                          query: search.text,
                        )));
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(10),
                ),
                foregroundColor: WidgetStateProperty.all(Colors.black),
                backgroundColor:
                    WidgetStateProperty.all(AppColors.gray.withOpacity(0.3)),
              ),
              color: Colors.black,
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const ListOfItems(),
      ],
    );
  }
}
