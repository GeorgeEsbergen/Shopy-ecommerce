// ignore_for_file: must_be_immutable
import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_indicator.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_snackbar.dart';
import '../../../cubit/signup/signup_cubit.dart';
import '../login/login.dart';
import 'widgets/form.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});
  final signupKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: BlocConsumer<SignupCubit, SignupState>(
                builder: (context, state) {
          SignupCubit cubit = context.read<SignupCubit>();
          return state is SignupLoading
              ? const CustomCircleIndicator()
              : Container(
                  width: AppResp(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "E Commerce",
                        style: AppFonts.b22_600,
                      ),
                      const SizedBox(height: 70),
                      SignupForm(
                        signupKey: signupKey,
                        email: email,
                        password: password,
                        name: name,
                        phone: phone,
                      ),
                      const SizedBox(height: 5),
                      const SizedBox(height: 80),
                      MainButton(
                        onTap: () {
                          if (signupKey.currentState!.validate()) {
                            cubit.signup(
                              email: email.text,
                              password: password.text,
                              name: name.text,
                              phone: phone.text,
                            );
                          }
                        },
                        name: 'Signup'.tr(context),
                      ),
                      const SizedBox(height: 20),
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
                            "already have account ? ",
                            style: AppFonts.b16_700,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Log in",
                              style: AppFonts.b16_700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
        }, listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.of(context).pushReplacementNamed(Login.routeName);
          }
          if (state is SignupFailure) {
            mainSnackBar(context, state.message);
          }
        })),
      ),
    );
  }
}
