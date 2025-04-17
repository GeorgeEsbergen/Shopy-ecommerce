import 'package:flutter/material.dart';

import '../../../main_pages/home/model/product_model.dart';
import 'home_details_body.dart';

class HomeDetails extends StatelessWidget {
   const HomeDetails({super.key, this.productModel});
  static String routeName = "Home Details";
  final ProductModel ?  productModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: HomeDetailsBody(productModel: productModel!,),
    );
  }
}
