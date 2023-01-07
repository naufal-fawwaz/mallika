import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/themes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

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
          top: defaultMargin,
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
            context.go('/onboarding');
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
                onButtonClicked: () {
                  context.read<AuthCubit>().signInGoogle();
                },
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

    void hideDialog() {
      if (context.canPop()) {
        context.pop();
      }
    }

    Future<void> showLoadingDialog() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> showErrorDialog(String message) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Terjadi Kesalahan'),
                Text(message),
                SizedBox(
                  height: defaultPadding,
                ),
                ElevatedButton(
                  onPressed: () {
                    hideDialog();
                  },
                  child: const Text('Tutup'),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            hideDialog();
            context.go("/main");
          } else if (state is AuthLoading) {
            showLoadingDialog();
          } else if (state is AuthFailed) {
            hideDialog();
            showErrorDialog(state.errorMessage);
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            clipBehavior: Clip.antiAlias,
            controller: scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: null,
                  background: Image.asset(
                    'images/img_login.png',
                    fit: BoxFit.cover,
                  ),
                ),
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 20),
                  child: Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: backgroundColor,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      children: [
                        headerTitle(),
                        SizedBox(height: defaultMargin + 12),
                        inputEmail(),
                        const SizedBox(height: 14),
                        inputPassword(),
                        SizedBox(height: defaultMargin),
                        signInButton(),
                        SizedBox(height: defaultMargin + 12),
                        signInOtherOptionTitle(),
                        SizedBox(height: defaultMargin + 12),
                        appleSignInButton(),
                        const SizedBox(height: 12),
                        facebookGoogleSignInButton(),
                        SizedBox(height: defaultMargin + 12),
                        termsAndCondition(),
                        SizedBox(height: defaultMargin),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
