import 'package:flutter/material.dart';

import 'home_details_body.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});
  static String routeName = "Home Details";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeDetailsBody(),
    );
  }
}
