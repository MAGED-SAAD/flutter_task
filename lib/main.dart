// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/Signup/Signup.dart';
import 'package:flutter_task/theme/Dark_Theme.dart';

import 'Home_page/Home_Page.dart';
import 'theme/Light_Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      
      theme: Light_Themee,
      darkTheme:Dark_Themee,

      home: Signup(),
    );
  }
}
