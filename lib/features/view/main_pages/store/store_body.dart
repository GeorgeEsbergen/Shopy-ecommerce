// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/list_of_all_items.dart';
import '../../../../core/widgets/search_text_field.dart';

class StoreBody extends StatelessWidget {
  StoreBody({super.key});
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(
          child: Text(
            'Store',
            style: AppFonts.b20_600,
          ),
        ),
        const SizedBox(height: 20),
        SearchTextField(
          controller: search,
          icon: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 20),
        const ListOfItems(),
      ],
    );
  }
}
