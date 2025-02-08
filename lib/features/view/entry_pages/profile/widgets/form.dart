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
    required this.signupKey,
  });
  final GlobalKey signupKey;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      return Form(
        key: signupKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              "Address",
              style: AppFonts.b16_700,
            ),
            const SizedBox(height: 12),
            MainTextField(
              controller: address,
              icon: Icons.location_on_outlined,
              keyboardType: TextInputType.streetAddress,
              validator: (value) => signUpValidator.validateAddress(value!),
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
