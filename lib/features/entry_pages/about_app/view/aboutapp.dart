import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/font_style.dart';
import 'about_app_details.dart';

class Aboutapp extends StatelessWidget {
  const Aboutapp({super.key});
  static String routeName = "about app";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:   AppBar(
        title:  Text(
          'About App'.tr(context),
          style: AppFonts.b20_600,
        ),
        centerTitle: true,
      ),
      body:const AboutAppDetails() ,
    );
  }
}
