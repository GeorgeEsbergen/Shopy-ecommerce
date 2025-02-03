import 'package:flutter/material.dart';

import 'profile_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static String routeName = "Profile";

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}