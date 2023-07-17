import 'package:flutter/material.dart';

import '../reusables/Colors.dart';

// class theme_Provider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.light;
// }

ThemeData Light_Themee = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.lite_green,
    ),
    colorScheme: ColorScheme.light(
      primary:MyColors.dark_green ,
      secondary: MyColors.lite_green,
      tertiary: MyColors.black,
      background: MyColors.white,
      
    ));
