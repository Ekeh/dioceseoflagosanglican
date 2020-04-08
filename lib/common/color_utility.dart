import 'package:flutter/material.dart';
class ColorUtility{
  static const Color COLOR_PRIMARY = const Color(0xFF188ece);
  static const Color COLOR_PRIMARY_DARK = const Color(0xFF0b4463);

 static const Color SUCCESS =  const Color(0xFF68aa4e);
  static const Color SUCCESS_DARK =  const Color(0xFF3b602c);
  static const Color WARNING =  const Color(0xFFffe568);
  static const Color WARNING_DARK =  const Color(0xFF96863f);
  static const Color DANGER =  const Color(0xFFf7260e);
  static const Color DANGER_DARK =  const Color(0xFF961709);
  static const Color INFO =  const Color(0xFF6bf7ff);
  static const Color INFO_DARK =  const Color(0xFF368084);
static const Color WHITE =  const Color(0xFFFFFFFF);
  static const Color WHITE_DARK =  const Color(0xFFCCCCCC);

  static const BUTTON_COLOR = COLOR_PRIMARY;
  static const BACKGROUND_GRADIENT_START_COLOR_WITH_APP_BAR = const Color(0xFFfc8383);
  static const BACKGROUND_GRADIENT_START_COLOR_WITHOUT_APP_BAR = const Color(0xFFf27d7d);
  static const APP_BAR_COLOR = const Color(0xFFE56E6E);

  static const PRIMARY_GRADIENT = const LinearGradient(
      //colors: const [ColorUtility.COLOR_PRIMARY, ColorUtility.COLOR_PRIMARY_DARK],
      colors: const [COLOR_PRIMARY, COLOR_PRIMARY_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
  static const SUCCESS_GRADIENT = const LinearGradient(
      colors: const [ColorUtility.SUCCESS, ColorUtility.SUCCESS_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
  static const DANGER_GRADIENT = const LinearGradient(
      colors: const [ColorUtility.DANGER, ColorUtility.DANGER_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
  static const WARNING_GRADIENT = const LinearGradient(
      colors: const [ColorUtility.WARNING, ColorUtility.WARNING_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
  static const INFO_GRADIENT = const LinearGradient(
      colors: const [ColorUtility.INFO, ColorUtility.INFO_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
  static const WHITE_GRADIENT = const LinearGradient(
      colors: const [ColorUtility.WHITE, ColorUtility.WHITE_DARK],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.0, 1.0],
      tileMode: TileMode.clamp
  );
}