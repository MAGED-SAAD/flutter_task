// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_task/Home_page/Home_Page.dart';

import '../global.dart';
import '../reusables/Bottom_Navigation.dart';
import '../reusables/Colors.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color? container_1;
  Color? container_2;
  Color? Text_container_1;
  Color? Text_container_2;

  // Color ? Text_container_1=MyColors.black;
  // Color ? Text_container_2=MyColors.black;

  @override
  void initState() {
    setState(() {
      ButtomNavigation_index = 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 100,
        //backgroundColor: MyColors.lite_green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home_Page(),
                ));
          },
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: MyColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: WillPopScope(
        onWillPop: () async {
          ButtomNavigation_index = 5;
          return true;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Dark Mode",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          //MyColors.black,
                          fontSize: 20),
                    ),
                  ),
                  Switch(
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    inactiveThumbColor: Theme.of(context).colorScheme.secondary,

                    value: is_dark_mode,
                    // currentBrightness==Brightness.dark?
                    // true
                    // :
                    // false,
                    onChanged: (value) {
                      setState(() {
                        
                        // currentBrightness==Brightness.dark?
                        // currentBrightness=Brightness.light
                        // :
                        // currentBrightness=Brightness.dark;

                        is_dark_mode = value;
                        print(is_dark_mode);
                        //print(currentBrightness);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Language",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          //MyColors.black,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                        // color: MyColors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: container_1,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  container_2 =
                                      Theme.of(context).colorScheme.background;
                                  container_1 =
                                      Theme.of(context).colorScheme.secondary;
                                  Text_container_2 =
                                      Theme.of(context).colorScheme.secondary;
                                  Text_container_1 =
                                      Theme.of(context).colorScheme.tertiary;

                                  // container_2=MyColors.white;
                                  // container_1=MyColors.lite_green;
                                  // Text_container_2=MyColors.black;
                                  // Text_container_1=MyColors.white;
                                });
                              },
                              child: Text(
                                "English",
                                style: TextStyle(
                                    color: Text_container_1 ??
                                        Theme.of(context).colorScheme.tertiary),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            color: MyColors.black,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: container_2,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  container_1 =
                                      Theme.of(context).colorScheme.background;
                                  container_2 =
                                      Theme.of(context).colorScheme.secondary;
                                  Text_container_1 =
                                      Theme.of(context).colorScheme.secondary;
                                  Text_container_2 =
                                      Theme.of(context).colorScheme.tertiary;

                                  // container_1=MyColors.white;
                                  // container_2=MyColors.lite_green;
                                  // Text_container_1=MyColors.black;
                                  // Text_container_2=MyColors.white;
                                });
                              },
                              child: Text(
                                "العربية",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Text_container_2 ??
                                        Theme.of(context).colorScheme.tertiary),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
