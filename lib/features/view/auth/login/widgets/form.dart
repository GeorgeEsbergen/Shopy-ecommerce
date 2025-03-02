// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/font_style.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../cubit/login/login_cubit.dart';
import '../../../../view_model/auth/login/validator.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
    required this.loginKey,
    required this.email,
    required this.password,
  });
  final GlobalKey loginKey;

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Form(
        key: loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login".tr(context),
              style: AppFonts.b22_600,
            ),
            const SizedBox(height: 60),
            Text(
              "Email".tr(context),
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            MainTextField(
              controller: email,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => loginValidator.validateEmail(value!),
            ),
            const SizedBox(height: 25),
            const Text(
              "Password",
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            PasswordTextField(
              controller: password,
              icon: BlocProvider.of<LoginCubit>(context).showPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              onPress: BlocProvider.of<LoginCubit>(context).showPass,
              isObscure: BlocProvider.of<LoginCubit>(context).showPassword,
              validator: (value) => loginValidator.validatePassword(value!),
            ),
          ],
        ),
      );
    });
  }
}
