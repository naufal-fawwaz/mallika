import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/onboarding_page_cubit.dart';
import 'package:malika/themes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    final PageController pageController = PageController();

    return Scaffold(
      body: BlocConsumer<OnboardingPageCubit, int>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                controller: pageController,
                children: const [
                  OnboardingItemPage(),
                  OnboardingItemPage(),
                  OnboardingItemPage(),
                ],
                onPageChanged: (value) {
                  context.read<OnboardingPageCubit>().setPage(value);
                },
              ),
              state == 0
                  ? Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        right: defaultMargin,
                        top: defaultMargin,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          padding:
                              const MaterialStatePropertyAll(EdgeInsets.all(4)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: buttonTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingItemPage extends StatelessWidget {
  const OnboardingItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('images/img_onboarding_1.png'),
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 250),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
