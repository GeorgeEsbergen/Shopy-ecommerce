import 'package:flutter/material.dart';
import 'store_body.dart';

class Store extends StatelessWidget {
  const Store({super.key});
  static String routeName = "Store";

  @override
  Widget build(BuildContext context) {
    return const StoreBody();
  }
}