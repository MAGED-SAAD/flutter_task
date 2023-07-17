// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_task/Home_page/Home_Page.dart';
import 'package:flutter_task/reusables/Colors.dart';

import '../Settings/Settings.dart';
import '../global.dart';


class MyBottomNavigationBar extends StatefulWidget {
  
  int? currentIndex;
  Function(int)? onTap;

  MyBottomNavigationBar({
    this.currentIndex,
    this.onTap
    });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: BottomNavigationBar(
          
          onTap: (value) {
            setState(() {
              if(ButtomNavigation_index==value){
      
              }else{
                ButtomNavigation_index = value;
                if(ButtomNavigation_index==0){
                  //clicked home page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_Page(),
                      ));
                }else{
                  ButtomNavigation_index = value;
                  //clicked settings
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                  ));
                }

              }
              
            });
          },
          backgroundColor:Theme.of(context).colorScheme.secondary,
          //MyColors.lite_green,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          //selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
              size: 30,
              ),
              label: "Home",
            ),

            
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
              size: 30,
              ),
              label: "Settings",
              
            ),
          ],
        ),
      ),
    );
  }
}
