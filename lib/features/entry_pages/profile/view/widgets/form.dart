// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_supabase/core/localization/aoo_localization.dart';
import 'package:e_commerce_with_supabase/core/widgets/main_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/font_style.dart';
import '../../../../../core/widgets/custom_indicator.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../../auth/login/model/user_data.dart';
import '../../../../auth/login/model/validator.dart';
import '../../../../auth/login/view_model/login_cubit.dart';

class ProfileForm extends StatefulWidget {
  ProfileForm({
    super.key,
    required this.signupKey,
  });
  final GlobalKey signupKey;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    GetUserDataModel? getdata = context.read<LoginCubit>().getUserDataModel;
    email.text = getdata!.email ?? "Known Name";
    phone.text = getdata.phone ?? "Known Name";
    name.text = getdata.name ?? "Known Name";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getUserData(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          GetUserDataModel? getdata =
              context.read<LoginCubit>().getUserDataModel;

          print(getdata);
          return state is getUserDataLoading
              ? const CustomCircleIndicator()
              : Form(
                  key: widget.signupKey,
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
                        readOnly: true,
                        controller: email,
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            signUpValidator.validateEmail(value!),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Name".tr(context),
                        style: AppFonts.b16_700,
                      ),
                      const SizedBox(height: 12),
                      MainTextField(
                        controller: name,
                        icon: Icons.person,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            signUpValidator.validateEmail(value!),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Phone".tr(context),
                        style: AppFonts.b16_700,
                      ),
                      const SizedBox(height: 12),
                      MainTextField(
                        controller: phone,
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            signUpValidator.validatePhone(value!),
                      ),
                      const SizedBox(height: 25),
                      // Text(
                      //   "Password".tr(context),
                      //   style: AppFonts.b16_700,
                      // ),
                      // const SizedBox(height: 12),
                      // PasswordTextField(
                      //   controller: password,
                      //   icon: BlocProvider.of<SignupCubit>(context).showPassword
                      //       ? Icons.visibility_off
                      //       : Icons.visibility,
                      //   onPress: BlocProvider.of<SignupCubit>(context).showPass,
                      //   isObscure: BlocProvider.of<SignupCubit>(context).showPassword,
                      //   validator: (value) => loginValidator.validatePassword(value!),
                      // ),
                      const SizedBox(height: 20),
                      Center(
                        child: MainButton(
                          onTap: () {
                            context.read<LoginCubit>().updateUserName(
                                getdata!.id,
                                {'name': name.text, 'phone': phone.text});
                            mainSnackBar(
                                context, "Profile Updated Successfully");
                            Navigator.of(context).pop();

                            context.read<LoginCubit>().getUserData();
                            // {'name': newName}
                          },
                          name: 'Update'.tr(context),
                        ),
                      ),
                    ],
                  ),
                );
        },
        listener: (BuildContext context, LoginState state) {},
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    phone.dispose();
    super.dispose();
  }
}
