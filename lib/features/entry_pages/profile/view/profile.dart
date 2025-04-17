import 'package:flutter/material.dart';

import 'profile_body.dart';

class Profile extends StatelessWidget {
  static String routeName = "profile";
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileBody();
  }
}
