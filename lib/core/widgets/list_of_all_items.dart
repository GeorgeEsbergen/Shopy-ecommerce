
import 'package:flutter/material.dart';

import 'item_card.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ItemCard(),
      itemCount: 10,
    );
  }
}
