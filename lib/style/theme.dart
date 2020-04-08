import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/color_utility.dart';

class CustomColors {


 /*static const primaryColor = const Color(0xFFf9483a);
 static const primaryColorDark = const Color(0xFF912c25);
  static const colorWhite = const Color(0xFFFFFFFF);
  static const darkGrey = const Color(0xFF555555);*/

   ThemeData get appTheme => _buildShrineTheme();

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor:  ColorUtility.COLOR_PRIMARY,
      primaryColor: ColorUtility.COLOR_PRIMARY,
      buttonColor: ColorUtility.COLOR_PRIMARY,
      scaffoldBackgroundColor: ColorUtility.COLOR_PRIMARY,
      cardColor: ColorUtility.COLOR_PRIMARY,
      textSelectionColor: ColorUtility.COLOR_PRIMARY,
      // TODO: Add the text themes (103)
      // TODO: Add the icon themes (103)
      // TODO: Decorate the inputs (103)
    );
  }


 /* static const Color loginGradientStart = ColorUtility.COLOR_PRIMARY;
  static const Color loginGradientEnd = ColorUtility.COLOR_PRIMARY_DARK;*/



}