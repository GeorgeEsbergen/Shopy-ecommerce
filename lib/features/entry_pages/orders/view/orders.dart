import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/font_style.dart';
import 'orders_body.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});
  static String routeName = "orders";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Orders'.tr(context),
          style: AppFonts.b20_600,
        ),
        centerTitle: true,
      ),
      body: const OrdersBody(),
    );
  }
}
