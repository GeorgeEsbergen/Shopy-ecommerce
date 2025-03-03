// ignore_for_file: must_be_immutable
import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/widgets/divider.dart';
import 'package:e_commerce_with_supabase/features/view/auth/signup/signup.dart';
import 'package:e_commerce_with_supabase/features/view/main_pages/bnv/bnv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/font_style.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/custom_indicator.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_snackbar.dart';
import '../../../cubit/login/login_cubit.dart';
import '../forgot_password/forgot_pass.dart';
import 'widgets/form.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final loginkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();

        return state is LoginLoading
            ? const CustomCircleIndicator()
            : Container(
                width: AppResp(context).size.width,
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
                      email: email,
                      password: password,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ForgotPass.routeName);
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
                          // Navigator.of(context).pushNamed(BNV.routeName);
                          cubit.login(
                              email: email.text, password: password.text);
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
              );
      }, listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacementNamed(BNV.routeName);
        }
        if (state is LoginFailure) {
          mainSnackBar(context, state.message);
        }
      })),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
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
