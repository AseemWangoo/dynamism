import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get headline1 => _headline1;
  static TextStyle get headline2 => _headline2;
  static TextStyle get headline3 => _headline3;
  static TextStyle get headline4 => _headline4;
  static TextStyle get subtitle => _subtitle;
  static TextStyle get bodyRegular => _bodyRegular;
  static TextStyle get bodyBold => _bodyBold;
  static TextStyle get caption => _caption;
  static TextStyle get display => _display;

  static const TextStyle _headline1 = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w700,
    fontSize: 34,
    color: Colors.white,
    height: 36 / 34,
  );

  static const TextStyle _headline2 = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: Colors.white,
    height: 30 / 28,
  );

  static const TextStyle _headline3 = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.white,
    height: 26 / 24,
  );

  static const TextStyle _headline4 = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w300,
    fontSize: 20,
    color: Colors.white,
    height: 23 / 20,
  );

  static const TextStyle _subtitle = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.white,
    height: 14 / 14,
  );

  static const TextStyle _bodyRegular = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.white,
    height: 18 / 14,
  );

  static final TextStyle _bodyBold = _bodyRegular.copyWith(
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle _caption = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: Colors.white,
    height: 14 / 13,
  );

  static const TextStyle _display = TextStyle(
    fontFamily: Fonts.roboto,
    fontWeight: FontWeight.w300,
    fontSize: 56,
    color: Colors.white,
    height: 48 / 56,
  );
}

class Fonts {
  Fonts._();

  static const String roboto = 'Roboto';
}
