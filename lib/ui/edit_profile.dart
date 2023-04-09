import 'package:flutter/material.dart';


import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_stack_container.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}
TextEditingController _fncontroller=TextEditingController();
TextEditingController _emailcontroller=TextEditingController();
final _formkey=GlobalKey<FormState>();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            CustomRow(
              myText:"Edit Profile",
              textFont: FontWeight.bold,
              textColor: Colors.white,
              textSize: 18,
              textSpaceing: 0,

            ),
            const SizedBox(
              height: 20,
            ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
             child: Form(
               key: _formkey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomStackContainer(
                     myImage: Image.asset("assets/images/artnine.jpg"),
                     addButton: GestureDetector(
                         onTap: (){

                         },
                         child: const Icon(
                           Icons.add,
                           size: 20,
                           color: Colors.black,
                         )),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   CustomText(

                     myText: "Full Name",
                     textFont: FontWeight.w600,
                     textColor: AppConstantWidget.blackColor,
                     textSize: 12,
                     textSpaceing: 1,
                   ),
                   const SizedBox(
                     height: 4,
                   ),
                   CustomTextformfield(
                     obsecurePWD:false ,
                     validate: (fn) =>
                     fn.isEmpty ? "Please Enter Your Full Name" : null,
                     controller: _fncontroller,
                     borderRadius: 20,
                     borderSide: 2,
                   ),
                   const SizedBox(height: 20,),
                   CustomText(

                     myText: "Email Address",
                     textFont: FontWeight.w600,
                     textColor: AppConstantWidget.blackColor,
                     textSize: 12,
                     textSpaceing: 1,
                   ),
                   const SizedBox(
                     height: 4,
                   ),
                   CustomTextformfield(
                     obsecurePWD:false ,
                     validate: (email) =>
                     email.isEmpty ? "Please Enter Your Emial Address" : null,
                     controller: _emailcontroller,
                     borderRadius: 20,
                     borderSide: 2,
                   ),
                   const SizedBox(height: 40,),
                   GestureDetector(
                     onTap: () {
                       if (_formkey.currentState!.validate()) {
                         print("Pressd");
                       }
                     },
                     child: CustomButton(
                       myText: "Update",
                       textFont: FontWeight.bold,
                       textSize: 15,
                       textColor: Colors.white,
                     ),
                   ),
                 ],
               ),
             ),
           ),
          ],
        ),
      ) ,
    );
  }
}
