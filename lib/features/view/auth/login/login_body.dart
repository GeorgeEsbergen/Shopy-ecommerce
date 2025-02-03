// ignore_for_file: must_be_immutable
import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/widgets/divider.dart';
import 'package:e_commerce_with_supabase/features/view/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/main_button.dart';
import '../../main_pages/bnv/bnv.dart';
import '../forgot_password/forgot_pass.dart';
import 'widgets/form.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: AppResp(context).size.width,
            height: AppResp(context).size.height,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ava Samouel",
                  style: AppFonts.b22_600,
                ),
                const SizedBox(height: 70),
                LoginForm(
                  loginKey: loginkey,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ForgotPass.routeName);
                      },
                      child: Text(
                        "Forgot Password !".tr(context),
                        style: AppFonts.b16_700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                MainButton(
                  onTap: () {
                    if (loginkey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(BNV.routeName);
                    }
                  },
                  name: 'Login'.tr(context),
                ),
                const SizedBox(height: 20),
                const ORContinueRow(),
                SizedBox(
                  width: AppResp(context).size.width / 2.5,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: const BorderSide(color: AppColors.black),
                        shadowColor: AppColors.black,
                        foregroundColor: AppColors.black,
                        backgroundColor: AppColors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Google'),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/icons/google.png',
                          width: 22,
                          height: 22,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account ? ",
                      style: AppFonts.b16_700,
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed(Signup.routeName),
                      child: const Text(
                        "Sign Up",
                        style: AppFonts.b16_700,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ORContinueRow extends StatelessWidget {
  const ORContinueRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const mainDivider(),
        const SizedBox(width: 5),
        Text('OR Continue With'.tr(context)),
        const SizedBox(width: 5),
        const mainDivider(),
      ],
    );
  }
}
