import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_text.dart';
class Pending extends StatefulWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical:0, horizontal: 10),
        child: ListView.builder(
          physics:BouncingScrollPhysics() ,
          itemCount: 2,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius:1,
                      blurRadius: 2,
                      offset:Offset(0,3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 5),
                child: Row(
                  children: [

                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            myText: "Task Name",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 15,
                            textSpaceing: 0,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          CustomText(
                            myText: "12/5/2023",
                            textFont: FontWeight.normal,
                            textColor: Colors.grey,
                            textSize: 13,
                            textSpaceing: 0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 25,
                          ),
                          CustomText(
                            myText: "Pending",
                            textFont: FontWeight.normal,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 13,
                            textSpaceing: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
