import 'package:flutter/material.dart';
import 'package:malika/themes.dart';
import 'custom_button.dart';

class OnboardingItemPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool buttonVisible;
  final VoidCallback? onButtonClicked;

  const OnboardingItemPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonVisible,
    this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('images/img_onboarding_1.png'),
          height: 500,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 250),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 65,
              horizontal: defaultMargin,
            ),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: outlineColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('images/ic_chef.png'),
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  title.toUpperCase(),
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: defaultPadding),
                Text(
                  subtitle,
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                buttonVisible
                    ? CustomButton(
                        type: ButtonType.solid,
                        onButtonClicked:
                            onButtonClicked != null ? onButtonClicked! : () {},
                        title: 'Get Started',
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
