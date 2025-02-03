import 'package:flutter/material.dart';

import 'favourite_body.dart';


class Favourite extends StatelessWidget {
  const Favourite({super.key});
  static String routeName = "Favourite";

  @override
  Widget build(BuildContext context) {
    return const FavouriteBody();
  }
}