import 'package:e_commerce_with_supabase/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/localization/aoo_localization.dart';
import 'core/sensitve_data/sensitive_data.dart';
import 'features/auth/login/view_model/login_cubit.dart';
import 'features/auth/signup/view_model/signup_cubit.dart';
import 'features/cubit/localization/localization_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/main_pages/bnv/view_model/bnv_cubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tzhflhqdshribwlaiehi.supabase.co',
    anonKey: anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit()..getUserData(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(),
        ),
        BlocProvider<BnvCubit>(
          create: (context) => BnvCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
        if (state is changeLanuageState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
