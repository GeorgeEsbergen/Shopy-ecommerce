import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import 'widgets/onboardingdetails.dart';
class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});
  static const String routeName = "OnBoardingThree";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OnBoardingImage(
              image: "assets/images/img2.png",
            ),
            const SizedBox(height: 10),
             Text( "onboardingTitle2".tr(context)),
            const SizedBox(height: 25),
            SizedBox(
              width: 272,
              child: RichText(
                textAlign: TextAlign.center,
                text:  TextSpan(
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(text: "onboardingDescription2".tr(context)),
                      
                    ]),
              ),
            ),
            const SizedBox(height: 160),
          ],
        ),
      ),
    );
  }
}
