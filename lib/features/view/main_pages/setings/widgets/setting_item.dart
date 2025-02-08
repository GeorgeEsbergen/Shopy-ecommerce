import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/font_style.dart';
import '../../../../../core/utils/responsive.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
    this.color,
  });
  final VoidCallback onTap;
  final String name;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppResp(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color ?? AppColors.black,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: AppFonts.b14_600.copyWith(color: color ?? AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
