import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.onPress,
    required this.isObscure,
    this.validator,
  });
  final TextEditingController controller;
  final IconData icon;
  final Function() onPress;
  final bool isObscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(
              0xffb2b2b2,
            ),
            blurRadius: 15)
      ]),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
            enabled: true,
            filled: true,
            fillColor: AppColors.white,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: AppColors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: AppColors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(
              onPressed: onPress,
              icon: Icon(icon),
              color: Colors.grey.withOpacity(0.6),
            )),
      ),
    );
  }
}
