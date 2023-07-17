// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_task/reusables/Bottom_Navigation.dart';
import 'package:flutter_task/reusables/Colors.dart';

import '../global.dart';

class Home_Page extends StatefulWidget {




  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {






  @override
  void initState() {
    setState(() {
      ButtomNavigation_index=0;
    });
    super.initState();
  }







  List Home_catagories_names=[
    "Dashboard",
    "Clinical & Nou_Clinical Risks",
    "OVR",
    "Staff Risk",
    "PCRA & ICRA",
    "KPIS"
  ];
  List Home_catagories_images=[
    "icons/Dashboard.png",
    "icons/Clinical.png",
    "icons/Ovr.png",
    "icons/Staff Risk.png",
    "icons/Pcra.png",
    "icons/Kpis.png"
  ];

  @override
  Widget build(BuildContext context) {

    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    setState(() {
      if(currentBrightness==Brightness.dark){
        is_darkkk=true;
      }else{
        is_darkkk=false;
      }
    });
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      bottomNavigationBar: MyBottomNavigationBar(),

      body:  WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            
            
            child: Stack(
              
              children: [
                
                
                
                    Transform.translate(
                    offset: Offset(-70, -140),
                    child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Theme.of(context).colorScheme.primary ,
                  //MyColors.dark_green,
                ),
              ),
            ),
                  ),
                
                
                  Transform.translate(
                offset: Offset(-80, -150),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 490,
                      height: 390,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Theme.of(context).colorScheme.secondary,
                        //MyColors.lite_green
                      ),
                    ),
                  ),
              ),
                
                
              Positioned(
                top: 100,
                left: 15,
                child: Row(
                  children: [
                
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text("Home",
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                
                    Image(
                              image: AssetImage(
                                'icons/Group 1205.png',
                              ),
                              )
                    
                  ],
                ),
              ),
                
                
      
      
      
      
      
      
      
                Padding(
                  padding: const EdgeInsets.only(top: 300,right:40 ,left:40,bottom: 40 ),
                  child: Column(
                      children: [
                        
                        GridView.builder(
                        
                          itemCount: 6,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20
                              ),
                          itemBuilder: (context, GridView_index) {
                            return Home_Item(
                              Item_image:Home_catagories_images[GridView_index] ,
                              Item_name:Home_catagories_names[GridView_index] ,
                              );
                          },
                        ),
                
                        
                
                
                      ],
                    ),
                ),
      
      
      
      
      
                // SizedBox(height: 20,)
      
      
      
      
      
      
                //MAin stackkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
                //MAin stackkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
              ],
            ),
          ),
        ),
      )
    );
  }
}


class Home_Item extends StatelessWidget {
  final String Item_name;
  final String Item_image;

  const Home_Item({
    super.key,
    required  this.Item_name,
    required  this.Item_image,


  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Color.fromARGB(208, 157, 222, 152),
        onTap: () {
          
        },
        child: Ink(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color:is_darkkk? 
            Theme.of(context).colorScheme.secondary
            :
            Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(1, 1),
                blurRadius: 10,
                spreadRadius: 1
              ),
              
            ]
          // border: Border.all(
          //   color: Color.fromARGB(255, 237, 234, 234),
          //   width: .5,
          // ),
          ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                        image: AssetImage(
                          Item_image,
                        ),
                        ),
              ),
              Text(Item_name)
            ],
          ),
        ),
      ),
    );
  }
}


































// InkWell(
//               borderRadius: BorderRadius.circular(15),
//               splashColor: Color.fromARGB(208, 157, 222, 152),
//               onTap: () {
                
//               },
//               child: Ink(
//                 height: 120,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       offset: Offset(0, 2),
//                       blurRadius: 10,
//                       spreadRadius: 1
//                     ),
                    
//                   ]
//                 // border: Border.all(
//                 //   color: Color.fromARGB(255, 237, 234, 234),
//                 //   width: .5,
//                 // ),
//                 ),
//                       child: Column(
                        
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Image(
//                               image: AssetImage(
//                                 First_Item_image,
//                               ),
//                               ),
//                     ),
//               Text(First_Item_name)
//                   ],
//                 ),
//               ),
//             ),