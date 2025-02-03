// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/search_text_field.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
        )
      ],
    );
  }
}
