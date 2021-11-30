import 'package:flutter/material.dart';

abstract class Constants {
  static int get numberOfRecipes => 10;
  static String get recipesApiKey => 'fbe57c18e4a642c4886141061b2c0099';
  static double get defaultPadding => 20.0;
  static double get defaultIconSize => 17.0;
  static double get smallFontSize => 12;
  static double get mediumFontSize => 14;
  static double get largeFontSize => 16;
  static double get giantFontSize => 20;
  static double get bottomNavigationBarHeight => 80;
  static double get listTileUserHeight => 100;
  static double get errorIconSize => 50;
  static double get errorTextSize => 30;
  // В больших проектах определяем все цвета в Theme, но в силу небольших размеров проекта,
  // и экономии времени выновим все цвета в файл с константами
  static Color get orangeColor => Color(0xffEB8A44);
  static Color get yellowColor => Color(0xffF9DC24);
  static Color get oliveGreenColor => Color(0xff4B7447);
  static Color get limeColor => Color(0xff8EBA43);
  static Color get defaultFontColor => Color(0xff262626);
  static Color get defaultIconColor => Color(0xff4a4a4a);
}
