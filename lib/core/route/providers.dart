import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/view_model/login_cubit.dart';
import '../../features/cubit/localization/localization_cubit.dart';

class BlocProviders {
  static List providers = [
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
    ),
    BlocProvider<LocalizationCubit>(
      create: (context) => LocalizationCubit()..getSavedLanguage(),
    ),
  ];
}
