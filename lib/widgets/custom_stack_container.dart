import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';


class CustomStackContainer extends StatelessWidget {
  const CustomStackContainer({Key? key, required this.myImage, required this.addButton})
      : super(key: key);
  final AssetImage myImage;
  final Widget addButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Stack(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  //color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:myImage,fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                bottom:1,
                right: 10,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
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
