import 'package:flutter/material.dart';

import 'home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
