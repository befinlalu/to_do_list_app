import 'package:flutter/material.dart';

//Main App Colors
Color primaryColor = const Color(0xFF22AADE);
Color backgroundColor1 = const Color(0xFF1E1E1E);
Color backgroundColor2 = const Color(0xFF353542);
Color textColor1 = const Color(0xffFFFFFF);
Color textColor2 = const Color(0xffA3A1A1);
Color redColor = const Color(0xffB10F2E);
Color orangeColor = const Color(0xffFFA699);
Color greenColor = const Color(0xff307351);

//Theme Data
ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: backgroundColor1,
    secondary: backgroundColor2,
    tertiary: primaryColor,
  ),
  dialogTheme: DialogTheme(
    barrierColor: backgroundColor1.withOpacity(.5),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    modalBarrierColor: backgroundColor2.withOpacity(.5),
  ),
);
