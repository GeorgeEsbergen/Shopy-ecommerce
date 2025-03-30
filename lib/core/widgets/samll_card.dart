import 'dart:math';

import 'package:flutter/material.dart';

import '../../features/view/entry_pages/home_details/home_details.dart';
import '../../features/view_model/product_model/product_model.dart';
import '../utils/colors.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.productModel,
    this.favBTN,
    required this.isFav,
    this.onPaymentSuccess,
  });
  final ProductModel productModel;
  final VoidCallback? favBTN;
  final VoidCallback? onPaymentSuccess;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeDetails(productModel: productModel))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  productModel.image_url ??
                      "https://img.freepik.com/free-vector/cosmetic-products-hair-care-water-splash_107791-2525.jpg?t=st=1738778236~exp=1738781836~hmac=92e319f1b881d847fc51514d9d4e925156acf6038c01ec04a59a6c2760e52137&w=1380",
                ))),
        width: 200,
        height: 220,
        child: Stack(
          children: [
            Positioned(
              right: 16,
              top: 8,
              child: GestureDetector(
                onTap: favBTN,
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.favorite,
                    color:
                        isFav ? Colors.red : AppColors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
