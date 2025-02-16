// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/font_style.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../../../core/widgets/password_text_field.dart';
import '../../../../cubit/signup/signup_cubit.dart';
import '../../../../view_model/auth/login/validator.dart';

class SignupForm extends StatelessWidget {
  SignupForm({
    super.key,
    required this.signupKey, required this.email, required this.password, required this.name, required this.phone,
  });
  final GlobalKey signupKey;

  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  final TextEditingController phone;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      return Form(
        key: signupKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Signup".tr(context),
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
              validator: (value) => signUpValidator.validateEmail(value!),
            ),
            const SizedBox(height: 25),
            const Text(
              "Name",
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            MainTextField(
              controller: name,
              icon: Icons.person,
              keyboardType: TextInputType.streetAddress,
              validator: (value) => signUpValidator.validateName(value!),
            ),
            const SizedBox(height: 25),
            const Text(
              "Phone",
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            MainTextField(
              controller: phone,
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
              validator: (value) => signUpValidator.validatePhone(value!),
            ),
            const SizedBox(height: 25),
            const Text(
              "Password",
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            PasswordTextField(
              controller: password,
              icon: BlocProvider.of<SignupCubit>(context).showPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              onPress: BlocProvider.of<SignupCubit>(context).showPass,
              isObscure: BlocProvider.of<SignupCubit>(context).showPassword,
              validator: (value) => loginValidator.validatePassword(value!),
            ),
          ],
        ),
      );
    });
  }
}
