import 'package:flutter/material.dart';

import 'item_card.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({
    super.key, this.shrinkWrap, this.physics,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap?? true,
      physics: physics?? const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ItemCard(),
      itemCount: 10,
    );
  }
}
