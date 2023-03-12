import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';


class CustomRow extends StatelessWidget {
  CustomRow(
      {Key? key, this.myText, this.textColor, this.textFont, this.textSize, this.textSpaceing})
      : super(key: key);
  final String? myText;
  final Color? textColor;
  final FontWeight? textFont;
  final double? textSize;
  final double? textSpaceing;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppConstantWidget.appColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Center(
          child: Text(
            myText!,
            style: TextStyle(
              fontWeight: textFont!,
              color: textColor!,
              fontSize: textSize!,
              letterSpacing: textSpaceing!,
            ),
          ),
        ),
    );
  }
}
