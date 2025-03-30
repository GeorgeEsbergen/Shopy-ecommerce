import 'package:e_commerce_with_supabase/core/widgets/main_button.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_text_field.dart';
import 'package:e_commerce_with_supabase/features/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/font_style.dart';
import '../../../../core/widgets/custom_indicator.dart';
import '../../../../core/widgets/main_snackbar.dart';
import '../../../view_model/auth/login/validator.dart';

// ignore: must_be_immutable
class ForgotPass extends StatefulWidget {
  static String routeName = "Forgot Password";
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController email = TextEditingController();

  final forgotPasskey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          titleTextStyle: AppFonts.b22_600,
          centerTitle: true,
        ),
        body: BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
          return state is resetPasswordLoading
              ? const CustomCircleIndicator()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: forgotPasskey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            'Enter Your Email To reset password',
                            style: AppFonts.b20_600.copyWith(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 20),
                          MainTextField(
                            validator: (value) =>
                                loginValidator.validateEmail(value!),
                            controller: email,
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          Align(
                              alignment: Alignment.center,
                              child: MainButton(
                                  onTap: () {
                                    if (forgotPasskey.currentState!.validate()) {
                                      context
                                          .read<LoginCubit>()
                                          .resetPassword(email: email.text);
                                    }
                                  },
                                  name: 'Send'))
                        ],
                      ),
                    ),
                                    ),
                  ));
        }, listener: (context, state) {
          if (state is resetPasswordSuccess) {
            mainSnackBar(context, "Check your email");
          }
        }));
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
