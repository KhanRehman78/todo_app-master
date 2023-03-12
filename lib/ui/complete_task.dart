import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_text.dart';
class CompleteTask extends StatefulWidget {
  const CompleteTask({Key? key}) : super(key: key);

  @override
  State<CompleteTask> createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
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
                      flex: 1,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/artnine.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            myText: "Task Name",
                            textFont: FontWeight.normal,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 13,
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
