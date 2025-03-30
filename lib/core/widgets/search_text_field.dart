import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.controller,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.readOnly,
    this.onTapField,
  });
  final TextEditingController controller;
  final Widget icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final VoidCallback? onTapField;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(),
        child: TextFormField(
          onTap: onTapField,
          readOnly: readOnly ?? false,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              enabled: true,
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.gray,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.gray,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.gray)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.gray)),
              suffixIcon: icon),
        ));
  }
}

class AddCommentTextField extends StatelessWidget {
  const AddCommentTextField({
    super.key,
    required this.controller,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.onTapField,
  });
  final TextEditingController controller;
  final Widget icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  final VoidCallback? onTapField;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(),
        child: TextFormField(
          onTap: onTapField,
          validator: validator,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              enabled: true,
              filled: true,
              fillColor: AppColors.white,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.gray,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: AppColors.gray,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 0, color: AppColors.gray)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 0, color: AppColors.gray)),
              suffixIcon: icon),
        ));
  }
}
