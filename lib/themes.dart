import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = const Color(0xFFF2F3F4);
Color primaryColor = const Color(0xFFFF8527);
Color borderColor = const Color(0xFFB3B4BA);
Color hintTextColor = const Color(0xFFB3B4BA);
Color outlineColor = const Color(0xFFE1E2E3);
Color greyColor = const Color(0xFF363773);

MaterialColor primary = const MaterialColor(
  0xFFFF8527,
  {
    50: Color.fromRGBO(255, 133, 39, .1),
    100: Color.fromRGBO(255, 133, 39, .2),
    200: Color.fromRGBO(255, 133, 39, .3),
    300: Color.fromRGBO(255, 133, 39, .4),
    400: Color.fromRGBO(255, 133, 39, .5),
    500: Color.fromRGBO(255, 133, 39, .6),
    600: Color.fromRGBO(255, 133, 39, .7),
    700: Color.fromRGBO(255, 133, 39, .8),
    800: Color.fromRGBO(255, 133, 39, .9),
    900: Color.fromRGBO(255, 133, 39, 1),
  },
);

TextStyle titleTextStyle = GoogleFonts.zillaSlab(
  color: Colors.black,
  fontSize: 40,
  fontWeight: FontWeight.w500,
);

TextStyle subtitleTextStyle = GoogleFonts.nunito(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

TextStyle hintTextStyle = GoogleFonts.nunito(
  fontSize: 16,
  color: hintTextColor,
  fontWeight: FontWeight.w400,
);

TextStyle buttonTextStyle = GoogleFonts.nunito(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

TextStyle regularTextStyle = GoogleFonts.nunito(
  fontSize: 12,
  color: Colors.black,
);

TextStyle greyTextStyle = GoogleFonts.nunito(
  fontSize: 16,
  color: const Color(0xFF636773),
);

double defaultMargin = 24;
double defaultPadding = 16;
