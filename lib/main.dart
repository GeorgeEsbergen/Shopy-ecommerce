import 'package:e_commerce_with_supabase/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/localization/aoo_localization.dart';
import 'features/cubit/bnv/bnv_cubit.dart';
import 'features/cubit/localization/localization_cubit.dart';
import 'features/cubit/login/login_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/cubit/signup/signup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://tzhflhqdshribwlaiehi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR6aGZsaHFkc2hyaWJ3bGFpZWhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkwODY1MDgsImV4cCI6MjA1NDY2MjUwOH0.qcYFkVRpi6rrBWnUTu1Ug2BxhEKN0BIEBZT372Xp36g',
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
          create: (context) => LoginCubit(),
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
