import 'package:flutter/material.dart';

import '../../../../../core/utils/font_style.dart';

class DeescriptionRow extends StatelessWidget {
  final String title;
  final String description;

  const DeescriptionRow(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      children: [
        Text(description, style: AppFonts.b14_600),
      ],
    );
  }
}
