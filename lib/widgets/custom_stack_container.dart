import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';


class CustomStackContainer extends StatelessWidget {
  const CustomStackContainer({Key? key, required this.myImage, required this.addButton})
      : super(key: key);
  final Widget myImage;
  final Widget addButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Stack(
            children: [
             CircleAvatar(
               radius: 50,
               child: myImage ,
             ),
              Positioned(
                bottom:1,
                right: 10,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppConstantWidget.appColor,
                  ),
                  child:addButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
