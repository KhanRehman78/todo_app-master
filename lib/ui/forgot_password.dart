import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
TextEditingController _emailcontroller=TextEditingController();
final _formkey=GlobalKey<FormState>();
class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
         child: Form(
           key:  _formkey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 40,),
               CustomText(
                 myText: "Forgot Password",
                 textFont: FontWeight.bold,
                 textColor: AppConstantWidget.appColor,
                 textSize: 25,
                 textSpaceing: 0,
               ),
               SizedBox(height: 30,),
               CustomText(
                 myText: "Email Address",
                 textFont: FontWeight.w600,
                 textColor: AppConstantWidget.blackColor,
                 textSize: 12,
                 textSpaceing: 1,
               ),
               SizedBox(
                 height: 4,
               ),
               CustomTextformfield(
                 validate: (email) =>
                 email.isEmpty ? "Please Enter Your Email" : null,
                 controller: _emailcontroller,
                 borderRadius: 20,
                 borderSide: 2,
               ),
               SizedBox(height: 60,),
               GestureDetector(
                 onTap: () {
                   if (_formkey.currentState!.validate()) {
                     print("Pressd");
                   }
                 },
                 child: CustomButton(
                   myText: "SEND",
                   textFont: FontWeight.bold,
                   textSize: 15,
                   textColor: Colors.white,
                 ),
               ),
             ],
           ),
         ),
       ),
     ) ,
    );
  }
}
