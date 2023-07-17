// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';


String flags_icon = "imgs/Kingdom.png";

class DorpDown extends StatefulWidget {
  double? height;
  double? width;
  double? borderRadius;
  Color? containerColor;
  Color? dropdowncolor;
  Color? dropdown_textColor;
  IconData? icon;
  Color? iconColor;
  final String hintText;
  Color? hintColor;
  List itemsList;
  bool? navigate;
  void Function(Object?)? myfun;
  Object?  ee;

  DorpDown(
      {this.height,
      this.width,
      this.borderRadius,
      this.containerColor,
      this.icon,
      this.iconColor,
      required this.hintText,
      this.hintColor,
      required this.itemsList,
      this.navigate,
      this.dropdowncolor,
      this.dropdown_textColor,
      this.myfun,
      this.ee
      });

  @override
  State<DorpDown> createState() => _DorpDownState();
}

class _DorpDownState extends State<DorpDown> {
  var selctedUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 150,
        height: widget.height ?? 30,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          color: widget.containerColor ?? Color.fromARGB(255, 194, 115, 180),
        ),
        child: Row(
          children: [
            DropdownButton(
              icon: Icon(
                Icons.arrow_drop_down,
                
              ),
              underline: Divider(
                color: Color.fromARGB(0, 0, 0, 0),
              ),
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  color:Theme.of(context).colorScheme.tertiary ,
                    //color: widget.hintColor ?? Colors.white, 
                    fontSize: 15),
              ),
              dropdownColor: widget.dropdowncolor,
              items: widget.itemsList
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(color: widget.dropdown_textColor),
                      )))
                  .toList(),
              onChanged:widget.myfun,
              value:widget.ee ,
            ),
          ],
        ));
  }
}