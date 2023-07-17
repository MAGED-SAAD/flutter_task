// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textForm({
  double? width,
  double? height,
  double? borderRadius,
  required TextInputType fieldType,
  String? hintText,
  Color? fieldColor,
  Color? border_boundries_color,
  Widget? prefixIcon,
  Widget? sufixfixIcon,
  TextEditingController? textForm_Controller,
  bool? onsubmit,
  void Function(String)? onChanged,
  bool? secureTexet,
  VoidCallback? ontap,
  String? Function(String?)? valditor,
  List<TextInputFormatter>? inputFormatter,
  TextAlign TextAlign=TextAlign.start,
  Widget ? suffix,
  
}) {
  return Container(
    //width un affect
    width: width,
    height: height,
    child: TextFormField(
      

      onTap: ontap,
      obscureText: secureTexet ?? true,
      controller: textForm_Controller,
      keyboardType: fieldType,
      validator: valditor,
      onFieldSubmitted: (string) {
        if (onsubmit ?? false) {
          print(string);
        }
      },
      onChanged:onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fieldColor,
        border: OutlineInputBorder(
          borderSide:  BorderSide(
                    color:Colors.white, // Set border color here
                  ),
          borderRadius: BorderRadius.circular(borderRadius ?? 9),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: sufixfixIcon,
        suffix: suffix,
        
      ),
      inputFormatters: inputFormatter,
      textAlign:TextAlign ,
    ),
  );
}
