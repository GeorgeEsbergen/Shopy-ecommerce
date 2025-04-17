import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';

import 'widgets/onboardingdetails.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});
  static const String routeName = "OnBoardingTwo";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OnBoardingImage(
              image: "assets/images/img1.png",
            ),
            const SizedBox(height: 10),
            Text( "onboardingTitle1".tr(context)),
            const SizedBox(height: 25),
            SizedBox(
              width: 272,
              child: Text("onboardingDescription1".tr(context)),
            ),
            const SizedBox(height: 100 + 60),
          ],
        ),
      ),
    );
  }
}
