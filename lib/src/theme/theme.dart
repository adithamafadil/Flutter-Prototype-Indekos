import 'package:flutter/material.dart';

import './constant_colors.dart';

final ThemeData mainTheme = _buildMainTheme();

ThemeData _buildMainTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: backgroundWhite,
    primaryColor: Colors.white,
    textTheme: _mainTextTheme(base.textTheme),
  );
}

TextTheme _mainTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1.copyWith(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
        headline2: base.headline2.copyWith(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w300,
        ),
        headline3: base.headline3.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          letterSpacing: 1,
          color: mainBlack,
        ),
        headline4: base.headline4.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: mainBlack,
        ),
        headline5: base.headline5.copyWith(
          color: mainBlack,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: base.subtitle1.copyWith(
          color: mainBlack.withOpacity(.65),
          fontSize: 14,
        ),
      )
      .apply(fontFamily: 'Oxygen');
}
