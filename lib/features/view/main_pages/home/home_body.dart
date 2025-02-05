// ignore_for_file: must_be_immutable
import 'package:e_commerce_with_supabase/core/utils/colors.dart';
import 'package:e_commerce_with_supabase/core/utils/font_style.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../../core/widgets/search_text_field.dart';
import 'widgets/categoris_list.dart';

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
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const CacheImage(
                      url:
                          "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380"),
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        )),
                    child: const Text('50 %', style: AppFonts.w16_500),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Name",
                      style: AppFonts.b14_600,
                    ),
                    Icon(
                      Icons.favorite,
                      color: AppColors.gray,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          '100 LE',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          '150 LE',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    MainButton(
                      onTap: () {},
                      name: 'Buy Now',
                      width: 110,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        )
      ],
    );
  }
}
