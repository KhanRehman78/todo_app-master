import 'package:flutter/material.dart';


import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_stack_container.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}
 TextEditingController _tncontroller=TextEditingController();
 TextEditingController _dtcontroller=TextEditingController();
 final _formkey=GlobalKey<FormState>();

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key:_formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomRow(
                  myText: "Add Task",
                  textFont: FontWeight.bold,
                  textColor: Colors.white,
                  textSize: 18,
                  textSpaceing: 0,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:25,horizontal: 10 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStackContainer(
                        myImage: AssetImage("assets/images/artnine.jpg"),
                        addButton: GestureDetector(
                            onTap: (){

                            },
                            child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.black,
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        myText: "Task Name",
                        textFont: FontWeight.w600,
                        textColor: AppConstantWidget.blackColor,
                        textSize: 12,
                        textSpaceing: 1,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      CustomTextformfield(
                        obsecurePWD:false ,
                        validate: (email) =>
                        email.isEmpty ? "Please Enter Your Task Name" : null,
                        controller: _tncontroller,
                        borderRadius: 20,
                        borderSide: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(

                        myText: "Date Time",
                        textFont: FontWeight.w600,
                        textColor: AppConstantWidget.blackColor,
                        textSize: 12,
                        textSpaceing: 1,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      CustomTextformfield(
                        keybored: TextInputType.datetime,
                        obsecurePWD:false ,
                        validate: (email) =>
                        email.isEmpty ? "Please Enter Your Task date time" : null,
                        controller: _dtcontroller,
                        borderRadius: 20,
                        borderSide: 2,
                      ),
                      SizedBox(height: 40,),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            print("Pressd");
                          }
                        },
                        child: CustomButton(
                          myText: "ADD",
                          textFont: FontWeight.bold,
                          textSize: 15,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
