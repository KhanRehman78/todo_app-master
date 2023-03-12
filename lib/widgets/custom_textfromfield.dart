import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';


class CustomTextformfield extends StatelessWidget {
  final bool? obsecurePWD;
  final TextEditingController controller;
  final double? borderRadius;
  final double? borderSide;
  final double? iconSize;
  final Color? iconColor;
  final Color? borderColor;
  final Widget? postIcon;
  final TextInputType? keybored;

  Function(String)? validate;
  CustomTextformfield({
    Key? key,
    this.validate,
    this.borderRadius = 20,
    this.borderSide = 2,
    this.postIcon,
    this.iconSize = 25,
    this.iconColor = Colors.white,
    required this.controller,
    this.obsecurePWD = true,
    this.borderColor = AppConstantWidget.appColor, this.keybored=TextInputType.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        validator: (value) => validate!(value!),
        obscureText: obsecurePWD!,
         keyboardType:keybored!,
        decoration: InputDecoration(
          suffixIcon: postIcon == null ? null : postIcon! ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: borderColor!, width: borderSide!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: borderColor!, width: borderSide!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: borderColor!, width: borderSide!),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(color: Colors.redAccent, width: borderSide!),
          ),
        ),
      ),
    );
  }
}
