import 'package:flutter/material.dart';

import '../../features/view/auth/forgot_password/forgot_pass.dart';
import '../../features/view/auth/login/login.dart';
import '../../features/view/auth/signup/signup.dart';
import '../../features/view/entry_pages/home_details/home_details.dart';
import '../../features/view/entry_pages/orders/orders.dart';
import '../../features/view/entry_pages/profile/profile.dart';
import '../../features/view/main_pages/bnv/bnv.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Login(),
    Login.routeName: (context) => const Login(),
    Signup.routeName: (context) => const Signup(),
    ForgotPass.routeName: (context) => ForgotPass(),
    BNV.routeName: (context) => BNV(),
    Profile.routeName: (context) => const Profile(),
    Orders.routeName: (context) => const Orders(),
    HomeDetails.routeName: (context) => const HomeDetails(),
  };
}
