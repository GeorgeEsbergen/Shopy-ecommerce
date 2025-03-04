import 'package:e_commerce_with_supabase/features/view_model/product_model/product_model.dart';
import 'package:flutter/material.dart';

import '../../features/view/entry_pages/home_details/home_details.dart';
import '../utils/colors.dart';
import '../utils/font_style.dart';
import 'cache_image.dart';
import 'main_button.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.productModel,
    this.favBTN, required this.isFav,
  });
  final ProductModel productModel;
  final VoidCallback? favBTN;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeDetails(productModel: productModel))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CacheImage(
                    url: productModel.image_url ??
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
                  child:
                      Text('${productModel.sale} %', style: AppFonts.w16_500),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productModel.name}",
                    style: AppFonts.b14_600,
                  ),
                  GestureDetector(
                    onTap: favBTN,
                    child:  Icon(
                      Icons.favorite,
                      color: isFav? Colors.red: AppColors.gray,
                    ),
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
                  Column(
                    children: [
                      Text(
                        '${productModel.price} LE',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${productModel.oldPrice} LE',
                        style: const TextStyle(
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
      ),
    );
  }
}
