import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
       this.myText="My Text",
       this.textColor=Colors.black,
       this.textFont=FontWeight.normal,
       this.textSize=16,
       this.textSpaceing=0,
      }
      )
      : super(key: key);

  final String? myText;
  final Color? textColor;
  final FontWeight? textFont;
  final double? textSize;
  final double? textSpaceing;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText!,
      style: TextStyle(
        fontWeight:textFont!,
        color:textColor!,
        fontSize:textSize!,
        letterSpacing:textSpaceing!,
      ),
    );
  }
}
