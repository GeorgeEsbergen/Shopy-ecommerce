import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/responsive.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    required this.name,
    this.width,
    this.height,
  });
  final VoidCallback onTap;
  final String name;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(100, 1, 1, 12),
          blurRadius: 10,
        )
      ]),
      width: width ?? AppResp(context).size.width / 2.5,
      height: height ?? 40,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: AppColors.black,
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.black),
        child: Text(name),
      ),
    );
  }
}
