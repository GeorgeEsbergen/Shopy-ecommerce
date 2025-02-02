import 'package:e_commerce_with_supabase/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/localization/aoo_localization.dart';
import 'features/cubit/localization/localization_cubit.dart';
import 'features/cubit/login/login_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/cubit/signup/signup_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
        if (state is changeLanuageState) {
          return MaterialApp(
            title: 'Flutter Demo',
            locale: state.locale,
            supportedLocales: const [Locale('ar'), Locale('en')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (devicelocale, supportedLocales) {
              if (devicelocale != null) {
                return devicelocale;
              }
              return null;
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routes: Routes.routes,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
