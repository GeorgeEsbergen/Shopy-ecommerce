import 'package:e_commerce_with_supabase/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/cache_image.dart';
import 'widgets/description.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          const CacheImage(
              url:
                  "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Name"),
                        Text("5432 LE"),
                      ],
                    ),
                    Icon(Icons.favorite)
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text('44'),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    MainButton(onTap: () {}, name: 'Add to card')
                  ],
                ),
                const DeescriptionRow(
                  description:
                      "FASDL FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA  FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA FDA ADSFLASK F AFSLK ASFLKF LASFKLFKSA ",
                  title: 'Description',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
