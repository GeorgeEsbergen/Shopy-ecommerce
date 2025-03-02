import 'package:flutter/material.dart';

import 'login_body.dart';

class Login extends StatelessWidget {
  static String routeName = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBody();
  }
}
