import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/auth/forgot_password/view/forgot_pass.dart';
import '../../features/auth/login/view/login.dart';
import '../../features/auth/signup/view/signup.dart';
import '../../features/entry_pages/about_app/view/aboutapp.dart';
import '../../features/entry_pages/home_details/view/home_details.dart';
import '../../features/entry_pages/orders/view/orders.dart';
import '../../features/entry_pages/profile/view/profile.dart';
import '../../features/main_pages/bnv/view/bnv.dart';
import '../../features/main_pages/onboardimg/view/page_view.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Supabase.instance.client.auth.currentUser != null
        ? BNV()
        : const PageViewDemo(),
    Login.routeName: (context) => const Login(),
    Signup.routeName: (context) => const Signup(),
    ForgotPass.routeName: (context) => const ForgotPass(),
    BNV.routeName: (context) => BNV(),
    Profile.routeName: (context) => const Profile(),
    Orders.routeName: (context) => const Orders(),
    HomeDetails.routeName: (context) => const HomeDetails(),
    Aboutapp.routeName: (context) => const Aboutapp()
  };
}
