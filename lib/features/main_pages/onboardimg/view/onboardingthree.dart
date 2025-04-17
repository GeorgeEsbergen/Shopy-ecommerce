import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/onboardingdetails.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});
  static const String routeName = "OnBoardingfourf";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OnBoardingImage(
              image: "assets/images/img3.png",
            ),
            Text(  "onboardingTitle3".tr(context),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 346,
              child: Text( 
                    "onboardingDescription3".tr(context),
              ),
            ),
            const SizedBox(height: 160),
          ],
        ),
      ),
    );
  }
}
