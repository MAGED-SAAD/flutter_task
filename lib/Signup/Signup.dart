// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_task/reusables/Colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Home_page/Home_Page.dart';
import '../reusables/TextForm.dart';
import '../reusables/drob_down.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool First_Opend = false;
  bool Second_Opend = false;
  bool Third_Opend = false;

    String day = '';
  String month = '';
  String year = '';
  DateTime? myDate;
  
//personal info
  var Name_1_cont = TextEditingController();
  var Name_2_cont = TextEditingController();
  var Adress_cont = TextEditingController();
  //var ID_cont = TextEditingController();
  var Mobile_cont = TextEditingController();
  var email_cont = TextEditingController();
  IconData secret1 = Icons.visibility_off;
  IconData secret2 = Icons.visibility_off;

  var pass1 = TextEditingController();
  var pass1Again = TextEditingController();

  bool? secureState1;
  bool? secureState2;

  var selctedUser_Passport;
  var selctedUser_City;
  var selctedUser_Region;
  String ?Gender;
  String? Api_Date;
//personal info

//work info
  var Clinic_cont = TextEditingController();
//work info


//Form  un handle valid
bool formm_unhandle_1_Valid=false;
//Form  un handle valid

  GlobalKey<FormState> FirstForm = new GlobalKey<FormState>();
  GlobalKey<FormState> SecondForm = new GlobalKey<FormState>();



  File? image;
  final PickedFile = ImagePicker();
  var getImg;

  cameraFun() async {
    getImg = await PickedFile.pickImage(source: ImageSource.camera);

    if (getImg != null) {
      setState(() {
        image = File(getImg.path);
      });
    }
  }

  galleryFun() async {
    getImg = await PickedFile.pickImage(source: ImageSource.gallery);

    if (getImg != null) {
      setState(() {
        image = File(getImg.path);
      });
    }
  }









  Future Delete_Alert() {
    return showDialog(
        context: context,
        builder: (builder) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AlertDialog(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Are You Sure to Sign up With The Entered Data ?",
                  ),

                ],
              ),
              actions: [
                TextButton(
                    onPressed: ()  {

                      Navigator.pop(context);
                      

                      var First_current_formState = FirstForm.currentState;
                      var Second_current_formState = SecondForm.currentState;
                      if(Gender==null||selctedUser_City==null||selctedUser_Region==null ||Api_Date==null||selctedUser_Passport==null){

                        formm_unhandle_1_Valid=false;

                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text(
                        //     "Please Check Work Info form",
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        //   //"This Email didn't Sign up Yet"),
                        //   behavior: SnackBarBehavior.floating,
                        //   backgroundColor: Color.fromARGB(255, 123, 12, 12),
                        //   showCloseIcon: true,
                        //   closeIconColor: Colors.white,
                        // ));
                        
                      }else{
                        formm_unhandle_1_Valid=true;
                      }
                      
                      if (First_current_formState!.validate()||formm_unhandle_1_Valid==true) {
                        if (Second_current_formState!.validate()) {

                          print("*******************");
                          print("All Forms valid inputs");
                          print("*******************");
                          
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Sign up Successfuly Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          //"This Email didn't Sign up Yet"),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        ));
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_Page(),
                        ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please Check Work Info form",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          //"This Email didn't Sign up Yet"),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color.fromARGB(255, 123, 12, 12),
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        ));
                        }
                      } else {
                        print(First_current_formState.toString());
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please Check Personal Info form",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          //"This Email didn't Sign up Yet"),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color.fromARGB(255, 163, 15, 15),
                          showCloseIcon: true,
                          closeIconColor: Colors.white,
                        ));
                      }



                    },






                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      
                      Navigator.pop(context);
                    },
                    child: Text("Cancle",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary
                      ),))
              ],
            ),
          );
        });
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: cameraFun,
                  child: Column(
                    children: [
                      Center(
                          child: image == null
                              ? ClipOval(
                                  child: Image(
                                      width: 170,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      image: AssetImage("icons/persone.png")),
                                )
                              : ClipOval(
                                  child: Image.file(
                                  image!,
                                  width: 170,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ))),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Take image"),
                          Icon(Icons.camera_alt_outlined)
                        ],
                      )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                //11111111111111111111111111111111111111
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (First_Opend == false) {
                            First_Opend = true;
                          } else {
                            First_Opend = false;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Personal Info",
                                style: TextStyle(
                                    fontSize: 20, color: MyColors.white),
                              ),
                            ),
                            Icon(
                                First_Opend == false
                                    ? Icons.arrow_drop_down_outlined
                                    : Icons.arrow_drop_up_outlined,
                                size: 30,
                                color: MyColors.white)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //Afterrrr oneeeeeeeeeeee opennnnnnn

                First_Opend == false
                    ? SizedBox.shrink()
                    : Form(
                        key: FirstForm,
                        child: Column(
                          children: [

                            SizedBox(height: 10,),

                            Row(

                              children: [
                                
                                Expanded(child: Text("Full Name")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      textForm_Controller: Name_1_cont,
                                      fieldType: TextInputType.name,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: false,
                                      valditor: (p0) {
                                        if (p0!.isEmpty) {
                                          return ("This is empty !");
                                        
                                        } else if(p0.toString().length<10){
                                          return ("Name must be more than 10 char");
                                        }
                                        else {
                                          return (null);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),




                            SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("City",
                                
                                ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        DorpDown(
                                          
                                          hintText: 'Passport',
                                          
                                          containerColor: Color.fromARGB(0, 41, 41, 41),
                                          iconColor: Color.fromARGB(0, 41, 41, 41),
                                          width: 100,
                                          hintColor: Colors.white,
                                          itemsList: ["Egypt","Uae", "sudan","usa"],
                                          dropdowncolor: Theme.of(context).colorScheme.secondary,
                                          dropdown_textColor: MyColors.white,
                                          myfun: (p0) {
                                            setState(() {
                                              selctedUser_Passport = p0.toString();
                                              
                                            });
                                          },
                                            ee: selctedUser_Passport
                                          ),

                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),





                            SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("Gender")),

                                Expanded(
                                  flex: 2,
                                  child:Row(
                                    children: [
                                      Text("Male"),
                                      Icon(Icons.male,
                                      color: Colors.blue,),
                                      Radio(value: "male", groupValue: Gender, onChanged: (value) {
                                        setState(() {
                                          Gender=value;
                                        });
                                      },),
                                      Text("Female"),
                                      Icon(Icons.female,
                                      color: Colors.pink,
                                      ),
                                      Radio(value: "Female", groupValue: Gender, onChanged: (value) {
                                        setState(() {
                                          Gender=value;
                                          print(Gender);
                                        });
                                      },),
                                    ],
                                  )
                                  
                                ),
                              ],
                            ),






                            SizedBox(height: 10,),

                            Row(

                              children: [
                                
                                Expanded(child: Text("Address")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      textForm_Controller: Adress_cont,
                                      fieldType: TextInputType.name,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: false,
                                      valditor: (p0) {
                                        if (p0!.isEmpty) {
                                          return ("This is empty !");
                                        
                                        } else if(p0.toString().length<5){
                                          return ("Name must be more than 9 char");
                                        }
                                        else {
                                          return (null);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),






                            SizedBox(height: 10,),

                            Row(

                              children: [
                                
                                Expanded(child: Text("City",
                                
                                ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        DorpDown(
                                          
                                          hintText: 'City',
                                          
                                          containerColor: Color.fromARGB(0, 41, 41, 41),
                                          iconColor: Color.fromARGB(0, 41, 41, 41),
                                          width: 100,
                                          hintColor: Colors.white,
                                          itemsList: ["Cairo", "Alex","delta"],
                                          dropdowncolor: Theme.of(context).colorScheme.secondary,
                                          dropdown_textColor: MyColors.white,
                                          myfun: (p0) {
                                            setState(() {
                                              selctedUser_City = p0.toString();
                                              
                                            });
                                          },
                                            ee: selctedUser_City
                                          ),

                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),








                            SizedBox(height: 10,),

                            Row(

                              children: [
                                
                                Expanded(child: Text("Region")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        DorpDown(
                                          
                                          hintText: 'Region',
                                          containerColor: Color.fromARGB(0, 41, 41, 41),
                                          iconColor: Color.fromARGB(0, 41, 41, 41),
                                          width: 100,
                                          hintColor: Colors.white,
                                          itemsList: ["Asia", "Africa","Europe"],
                                          dropdowncolor: Theme.of(context).colorScheme.secondary,
                                          dropdown_textColor: MyColors.white,
                                          myfun: (p0) {
                                            setState(() {
                                              selctedUser_Region = p0.toString();
                                              
                                            });
                                          },
                                            ee: selctedUser_Region
                                          ),

                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),












                            

                            SizedBox(
                              height: 10,
                            ),





                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(
                          child: Text(
                            "Date of Birth"
                            )
                            ),

                        Expanded(
                          flex: 2,
                          child: InkWell(
                            splashColor: MyColors.lite_green,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              myDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2040),
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: MyColors.lite_green,
                                          onPrimary: MyColors.white,
                                          secondary:MyColors.dark_green,
                                        ),
                                      ),
                                      child: child!);
                                },
                              );
                              if (myDate == null) {
                              } else {
                                if (myDate!.month.toString().length < 2) {
                                  month = "0${myDate!.month}";
                                } else {
                                  month = myDate!.month.toString();
                                }
                                if (myDate!.day.toString().length < 2) {
                                  day = "0${myDate!.day}";
                                } else {
                                  day = myDate!.day.toString();
                                }
                                if (myDate!.year.toString().length < 2) {
                                  year = "0${myDate!.year}";
                                } else {
                                  year = myDate!.year.toString();
                                }
                                setState(() {
                                  Api_Date = "${year}-${month}-${day}";
                                });
                        
                                
                              }
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).colorScheme.secondary,
                                  border: Border.all(
                                    color: Colors
                                        .grey, // Set the border color here
                                    width: 1,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Center(
                                  child: Text(
                                    Api_Date ?? "Date",
                                    style: TextStyle(
                                      fontSize: 15,
                                      //color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),






                    SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("Mobile")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      textForm_Controller: Mobile_cont,
                                      fieldType: TextInputType.number,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: false,
                                      valditor: (p0) {
                                        if (p0!.isEmpty) {
                                          return ("This is empty !");
                                        }else if(p0.toString().length<11||p0.toString().length>11){
                                          return ("Number must be 11 charchter");
                                        }
                                        else {
                                          return (null);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),








                            SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("E-mail")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      textForm_Controller: email_cont,
                                      fieldType: TextInputType.emailAddress,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: false,
                                      valditor: (p0) {
                                        final Emailpattern =
                                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
                                        final Phonepattern = RegExp(r'^\d+$');
                    
                                        if (p0!.isEmpty) {
                                          return ("this field is Empty !");
                                        } else if (Emailpattern.hasMatch(p0)) {
                                          print("this field is email");
                                          
                                          return (null);
                                        } else if (Phonepattern.hasMatch(p0)) {
                                          if (p0.length < 11 || p0.length > 11) {
                                            return ("enter valid phone number contain 11 digit");
                                          }
                                          print("this field is phone number");
                                          return (null);
                                        } else {
                                          return ("please enter vaild phone or email");
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),








                            SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("Password")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      valditor: (p0) {
                                      if (p0 == null) {
                                        return ("this field is null !");
                                      } else if (p0.isEmpty) {
                                        return ("this field is Empty !");
                                        //"this field is Empty !");
                                      } else if (p0.length < 4) {
                                        return ("password must be more than 3 characters !");
                                        //"password must be more than 3 characters !");
                                      } else {
                                        return (null);
                                      }
                                    },
                                      TextAlign: TextAlign.start,
                                      sufixfixIcon: IconButton(
                                      icon: Icon(
                                        secret1,
                                        color: MyColors.lite_green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (secureState1 == !false) {
                                            secureState1 = false;
                                            secret1 = Icons.remove_red_eye;
                                          } else {
                                            secureState1 = true;
                                            secret1 = Icons.visibility_off;
                                          }
                                        });
                                      },
                                    ),
                                      textForm_Controller: pass1,
                                      fieldType: TextInputType.text,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: secureState1,
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),






                            SizedBox(height: 10,),


                            Row(

                              children: [
                                
                                Expanded(child: Text("Confirm Password")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      
                                      valditor: (p0) {
                                      if (p0 == null) {
                                        return ("this field is null !");
                                      } else if (p0.isEmpty) {
                                        return ("this field is Empty !");
                                        //"this field is Empty !");
                                      } else if (p0.length < 4) {
                                        return ("password must be more than 3 characters !");
                                        //"password must be more than 3 characters !");
                                      } else if(pass1.text.toString()!=pass1Again.text.toString()){
                                        
                                        return ("Password Are Diffrent");
                                      }
                                      else {
                                        return (null);
                                      }
                                    },
                                      TextAlign: TextAlign.start,
                                      sufixfixIcon: IconButton(
                                      icon: Icon(
                                        secret2,
                                        color: MyColors.lite_green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (secureState2 == !false) {
                                            secureState2 = false;
                                            secret2 = Icons.remove_red_eye;
                                          } else {
                                            secureState2 = true;
                                            secret2 = Icons.visibility_off;
                                          }
                                        });
                                      },
                                    ),
                                      textForm_Controller: pass1Again,
                                      fieldType: TextInputType.text,
                                      fieldColor:Theme.of(context).colorScheme.background,
                                      secureTexet: secureState2,
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),













                            SizedBox(height: 10,),
                          ],
                        ),
                      ),

                //222222222222222222222222222222222222222

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (Second_Opend == false) {
                            Second_Opend = true;
                          } else {
                            Second_Opend = false;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Work Info",
                                style: TextStyle(
                                    fontSize: 20, color: MyColors.white),
                              ),
                            ),
                            Icon(
                                Second_Opend == false
                                    ? Icons.arrow_drop_down_outlined
                                    : Icons.arrow_drop_up_outlined,
                                size: 30,
                                color: MyColors.white)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //Afterrrr twoooooooooooo opennnnnnnnnnn

                Second_Opend == false
                    ? SizedBox.shrink()
                    : Form(
                        key: SecondForm,
                        child: Column(
                          children: [
                            

                            SizedBox(height: 10,),

                            Row(

                              children: [
                                
                                Expanded(child: Text("Clinic Name")),

                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: textForm(
                                      textForm_Controller: Clinic_cont,
                                      fieldType: TextInputType.name,
                                      fieldColor:
                                          Theme.of(context).colorScheme.background,
                                      secureTexet: false,
                                      valditor: (p0) {
                                        if (p0!.isEmpty) {
                                          return ("This is empty !");
                                        
                                        } else if(p0.toString().length<10){
                                          return ("Name must be more than 10 char");
                                        }
                                        else {
                                          return (null);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),





                          ],
                        ),
                      ),

                //33333333333333333333333333333333333333333333333333333

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (Third_Opend == false) {
                            Third_Opend = true;
                          } else {
                            Third_Opend = false;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Medical Info",
                                style: TextStyle(
                                    fontSize: 20, color: MyColors.white),
                              ),
                            ),
                            Icon(
                                Third_Opend == false
                                    ? Icons.arrow_drop_down_outlined
                                    : Icons.arrow_drop_up_outlined,
                                size: 30,
                                color: MyColors.white)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      setState(() {
                        First_Opend=true;
                        Second_Opend=true;
                      });
                      Delete_Alert();
                      // // print(Gender);
                      // // print(selctedUser);
                      // // print(selctedUser_Region);
                      // // print(Api_Date);
                    
                      // var First_current_formState = FirstForm.currentState;
                      // var Second_current_formState = SecondForm.currentState;
                      // if(Gender==null||selctedUser_City==null||selctedUser_Region==null ||Api_Date==null||selctedUser_Passport==null){

                      //   formm_unhandle_1_Valid=false;

                      //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   //   content: Text(
                      //   //     "Please Check Work Info form",
                      //   //     style: TextStyle(
                      //   //         color: Colors.white,
                      //   //         fontWeight: FontWeight.bold),
                      //   //   ),
                      //   //   //"This Email didn't Sign up Yet"),
                      //   //   behavior: SnackBarBehavior.floating,
                      //   //   backgroundColor: Color.fromARGB(255, 123, 12, 12),
                      //   //   showCloseIcon: true,
                      //   //   closeIconColor: Colors.white,
                      //   // ));
                        
                      // }else{
                      //   formm_unhandle_1_Valid=true;
                      // }
                      
                      // if (First_current_formState!.validate()||formm_unhandle_1_Valid==true) {
                      //   if (Second_current_formState!.validate()) {

                      //     print("*******************");
                      //     print("All Forms valid inputs");
                      //     print("*******************");
                          
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //       "Sign up Successfuly Done",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: Colors.green,
                      //     showCloseIcon: true,
                      //     closeIconColor: Colors.white,
                      //   ));
                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Home_Page(),
                      //   ));
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //       "Please Check Work Info form",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: Color.fromARGB(255, 123, 12, 12),
                      //     showCloseIcon: true,
                      //     closeIconColor: Colors.white,
                      //   ));
                      //   }
                      // } else {
                      //   print(First_current_formState.toString());
                      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //       "Please Check Personal Info form",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     //"This Email didn't Sign up Yet"),
                      //     behavior: SnackBarBehavior.floating,
                      //     backgroundColor: Color.fromARGB(255, 163, 15, 15),
                      //     showCloseIcon: true,
                      //     closeIconColor: Colors.white,
                      //   ));
                      //}
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20, color: MyColors.white),
                      ),
                    ),
                  ),
                ),

                //mainnn columnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
                //mainnn columnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
              ],
            ),
          ),
        ),
      ),
    );
  }
}
