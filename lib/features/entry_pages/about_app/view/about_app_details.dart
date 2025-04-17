import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/utils/font_style.dart';
import 'package:flutter/material.dart';

class AboutAppDetails extends StatelessWidget {
  const AboutAppDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
      children: [
        Container(
          width: double.infinity,
          height: 230,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Set border color to gray
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img1.png"))),
        ),
        const SizedBox(height: 20),
        Text(
          "About1".tr(context),
          style: AppFonts.b14_500,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 230,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Set border color to gray
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img2.png"))),
        ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          "About2".tr(context),
          style: AppFonts.b14_500,
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 230,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Set border color to gray
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/img3.png"))),
        ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          "About3".tr(context),
          style: AppFonts.b14_500,
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
