// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/reusables/Colors.dart';

ThemeData Dark_Themee = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 98, 97, 97)
  ),
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 23, 23, 23),
    primary: Color.fromARGB(255, 55, 54, 54),
    secondary: Color.fromARGB(255, 98, 97, 97),
    tertiary: MyColors.white
  )
  );
