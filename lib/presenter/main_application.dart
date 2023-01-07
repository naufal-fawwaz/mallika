import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/cubit/grocery/checklist_cubit.dart';
import 'package:malika/routes/main_routes.dart';
import 'package:malika/themes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingPageCubit()),
        BlocProvider(create: (context) {
          var cubit = AuthCubit();
          cubit.getLoggedInUser();
          return cubit;
        }),
        BlocProvider(create: ((context) => ChecklistCubit()))
      ],
      child: MaterialApp.router(
        title: 'Mallika',
        theme: ThemeData(
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          primarySwatch: primary,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
