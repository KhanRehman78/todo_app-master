import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';


class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.borderRadius=20,
      this.containerHight=60,
      this.containerwidth=double.infinity,
      this.containerColor=AppConstantWidget.appColor,
        this.myText="My Text",
        this.textColor=Colors.black,
        this.textFont=FontWeight.normal,
        this.textSize=16,
        this.textSpaceing=0,

      })
      : super(key: key);

  final double? borderRadius;
  final double? containerHight;
  final double? containerwidth;
  final Color? containerColor;
  final String? myText;
  final Color? textColor;
  final FontWeight? textFont;
  final double? textSize;
  final double? textSpaceing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:containerHight!,
      width:containerwidth!,
      decoration: BoxDecoration(
        color:containerColor!,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Center(child:Text(
        myText!,
        style: TextStyle(
          fontWeight:textFont!,
          color:textColor!,
          fontSize:textSize!,
          letterSpacing:textSpaceing!,
        ),
      ),
      ),
    );
  }
}
