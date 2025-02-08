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
        title: const Text(
          'Orders',
          style: AppFonts.b20_600,
        ),
        centerTitle: true,
      ),
      body: const OrdersBody(),
    );
  }
}
