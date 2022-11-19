import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malika/components/custom_button.dart';
import 'package:malika/components/custom_text_field.dart';
import 'package:malika/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= 200) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        );
      }
    });

    Widget headerTitle() {
      return Container(
        padding: EdgeInsets.only(
          top: 42,
          right: defaultPadding,
          left: defaultPadding,
        ),
        child: Column(
          children: [
            Text('Mallika', style: titleTextStyle),
            Text('Everyone can be a chef', style: subtitleTextStyle),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomTextField(
          hint: 'Enter your email',
          controller: emailController,
          title: 'Email Address',
          inputType: TextInputType.emailAddress,
          imeOptions: TextInputAction.next,
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomTextField(
          hint: 'Enter your password',
          controller: passwordController,
          title: 'Password',
          inputType: TextInputType.visiblePassword,
          imeOptions: TextInputAction.next,
          obscureText: true,
        ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomButton(
          type: ButtonType.solid,
          onButtonClicked: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/onboarding', (route) => false);
          },
          title: 'Sign In',
        ),
      );
    }

    Widget signInOtherOptionTitle() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding * 4),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: borderColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'OR',
              style: subtitleTextStyle.copyWith(
                color: borderColor,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: borderColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget appleSignInButton() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomButton(
          type: ButtonType.outlined,
          onButtonClicked: () {},
          title: 'Continue with Apple',
          imageAssets: 'images/ic_apple.png',
        ),
      );
    }

    Widget facebookGoogleSignInButton() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                type: ButtonType.outlined,
                onButtonClicked: () {},
                title: 'Facebook',
                imageAssets: 'images/ic_facebook.png',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                type: ButtonType.outlined,
                onButtonClicked: () {},
                title: 'Google',
                imageAssets: 'images/ic_google.png',
              ),
            ),
          ],
        ),
      );
    }

    Widget termsAndCondition() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Text(
              'By continuing, you agree to our',
              style: regularTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: regularTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log('Tap on service');
                      },
                  ),
                  TextSpan(
                    text: " • ",
                    style: regularTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: regularTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log('Tap on service');
                      },
                  ),
                  TextSpan(
                    text: " • ",
                    style: regularTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Content Policy',
                    style: regularTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        log('Tap on service');
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage("images/img_login.png"),
            width: double.infinity,
            fit: BoxFit.cover,
            height: 300,
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultMargin),
                  topRight: Radius.circular(defaultMargin),
                ),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerTitle(),
                  const SizedBox(height: 36),
                  inputEmail(),
                  const SizedBox(height: 14),
                  inputPassword(),
                  SizedBox(height: defaultMargin),
                  signInButton(),
                  const SizedBox(height: 36),
                  signInOtherOptionTitle(),
                  const SizedBox(height: 36),
                  appleSignInButton(),
                  const SizedBox(height: 12),
                  facebookGoogleSignInButton(),
                  const SizedBox(height: 36),
                  termsAndCondition(),
                  SizedBox(height: defaultMargin)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
