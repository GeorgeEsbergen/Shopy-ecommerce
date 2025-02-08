import 'package:flutter/material.dart';
import '../../../../core/widgets/list_of_all_items.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListOfItems(
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
    );
  }
}
