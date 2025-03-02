import 'package:flutter/material.dart';

// ignore: camel_case_types
class mainDivider extends StatelessWidget {
  const mainDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      height: 1,
      width: 50,
      decoration: const BoxDecoration(color: Colors.grey),
    );
  }
}
