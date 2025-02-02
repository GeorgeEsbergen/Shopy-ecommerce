import 'package:flutter/material.dart';

import '../../features/view/auth/forgot_password/forgot_pass.dart';
import '../../features/view/auth/login/login.dart';
import '../../features/view/auth/signup/signup.dart';


class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Login(),
    Login.routeName: (context) => const Login(),
    Signup.routeName:(context) => const Signup(),
    ForgotPass.routeName:(context)=> ForgotPass(),
    
  };
}
