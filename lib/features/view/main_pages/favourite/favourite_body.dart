import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/list_of_all_items.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        Center(
          child: Text(
            'Favourites'.tr(context),
            style: AppFonts.b20_600,
          ),
        ),
        const SizedBox(height: 20),
        const ListOfItems(isFavScreen: true,),
      ],
    );
  }
}
