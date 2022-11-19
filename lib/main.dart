import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/onboarding_page_cubit.dart';
import 'package:malika/pages/login_page.dart';
import 'package:malika/pages/onboarding_page.dart';
import 'package:malika/themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => OnboardingPageCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: primaryColor,
            backgroundColor: backgroundColor,
            primarySwatch: primary,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': ((context) => const LoginPage()),
            '/onboarding': ((context) => const OnboardingPage()),
          },
          initialRoute: '/',
        ));
  }
}
