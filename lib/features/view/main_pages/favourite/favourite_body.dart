import 'package:flutter/material.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/list_of_all_items.dart';
class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Text(
            'Favourites',
            style: AppFonts.b20_600,
          ),
        ),
        SizedBox(height: 20),
        ListOfItems(),
      ],
    );
  }
}
