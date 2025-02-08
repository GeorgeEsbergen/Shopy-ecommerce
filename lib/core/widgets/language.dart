import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cubit/localization/localization_cubit.dart';
import '../utils/colors.dart';
import '../utils/font_style.dart';
import '../utils/responsive.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.language),
        Container(
          height: 40,
          color: Colors.grey.withOpacity(0.0),
          width: AppResp(context).size.width / 1.3,
          child: BlocConsumer<LocalizationCubit, LocalizationState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is changeLanuageState) {
                return DropdownButton<String>(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  style: const TextStyle(color: Colors.red),
                  value: state.locale
                      .languageCode, // Using languageCode instead of countryCode
                  items: ['ar', 'en'].map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item == 'ar' ? "عربي" : 'English',
                        style:
                            AppFonts.b14_600.copyWith(color: AppColors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      BlocProvider.of<LocalizationCubit>(context)
                          .changeLanguage(newValue);
                    }
                  },
                  underline: Container(), // Removes the underline
                  isExpanded:
                      true, // Makes the dropdown take the full width of the container
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }
}
