import 'package:flutter/material.dart';
import 'settings_body.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = "Settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsBody();
  }
}
