import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => "Lunch Now";
  static ThemeData get theme => ThemeData(
      primaryColor: const Color(0xffF86200),
      primaryColorDark: const Color(0xffFFA500),
      primaryColorLight: const Color(0xffFF914D),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF86200),
      ));
}
