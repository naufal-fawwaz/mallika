import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/themes.dart';
import 'package:go_router/go_router.dart';

import '../widgets/onboarding_page_item.dart';

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
    List<OnboardingItemPage> pages = [
      const OnboardingItemPage(
        title: 'Make Recipes on your own',
        subtitle:
            "With mallika recipe editor, you can easily edit reciped, save adjustment to ingredients, and add additional steps or tips to your preparation",
        buttonVisible: false,
      ),
      const OnboardingItemPage(
        title: 'All in one place',
        subtitle:
            'Storing your recipes in Mallika allows you to quickly search, find, and select what you want to cook.',
        buttonVisible: false,
      ),
      OnboardingItemPage(
        title: 'Cook from your favorite device',
        subtitle:
            'Mallika stores your recipes in the Cloud so you can access them on any device through our website or Android/iOS app.',
        buttonVisible: true,
        onButtonClicked: () {
          context.go('/main');
        },
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<OnboardingPageCubit, int>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              PageView(
                controller: pageController,
                children: pages,
                onPageChanged: (value) {
                  context.read<OnboardingPageCubit>().setPage(value);
                },
              ),
              Positioned(
                bottom: defaultMargin,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pages.map(
                    (e) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: pages.indexOf(e) == state
                            ? BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(4),
                              )
                            : BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: primaryColor,
                                  width: 1,
                                ),
                              ),
                      );
                    },
                  ).toList(),
                ),
              ),
              state != pages.length - 1
                  ? Positioned(
                      right: defaultMargin,
                      top: defaultMargin,
                      child: BlackButton(
                        title: 'Skip',
                        onClick: () {
                          pageController.animateToPage(
                            pages.length - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 6),
                        borderRadius: 18,
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

class BlackButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final EdgeInsets padding;
  final double borderRadius;

  const BlackButton({
    super.key,
    required this.title,
    required this.onClick,
    required this.padding,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        padding: MaterialStatePropertyAll(padding),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Text(
        title,
        style: buttonTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
