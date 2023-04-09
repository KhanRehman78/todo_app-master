import 'package:flutter/material.dart';
import 'package:todo_app/infrastructure/model/user_model.dart';
import 'package:todo_app/infrastructure/services/auth_services.dart';
import 'package:todo_app/infrastructure/services/user_servies.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _namecontroller = TextEditingController();

TextEditingController _pwdcontroller = TextEditingController();
final _formkey = GlobalKey<FormState>();
bool obsecure = true;

class _SignUpScreenState extends State<SignUpScreen> {
  AuthServices _authServices = AuthServices();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomText(
                    myText: "SIGNUP",
                    textFont: FontWeight.bold,
                    textColor: AppConstantWidget.appColor,
                    textSize: 25,
                    textSpaceing: 0,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    myText: "Welcome Back!",
                    textFont: FontWeight.w600,
                    textColor: AppConstantWidget.subColor,
                    textSize: 20,
                    textSpaceing: 0,
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
                    validate: (email) =>
                    email.isEmpty ? "Please Enter Your Full Name" : null,
                    controller: _namecontroller,
                    borderRadius: 20,
                    borderSide: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                    validate: (email) =>
                    email.isEmpty ? "Please Enter Your Email" : null,
                    controller: _emailcontroller,
                    borderRadius: 20,
                    borderSide: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    myText: "Password",
                    textFont: FontWeight.w600,
                    textColor: AppConstantWidget.blackColor,
                    textSize: 12,
                    textSpaceing: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomTextformfield(
                    postIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        child: Icon(
                          obsecure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: Colors.black,
                          size: 35,
                        )),
                    validate: (pwd) =>
                    pwd.isEmpty ? "Please Enter Your Password" : null,
                    iconColor: Colors.black,
                    iconSize: 35,
                    obsecurePWD: obsecure,
                    controller: _pwdcontroller,
                    borderRadius: 20,
                    borderSide: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        ///
                        _authServices.registerUser(email: _emailcontroller.text,
                            password: _pwdcontroller.text).then((value) {
                           ///
                          _userServices.createUser(UserModel(
                            uid: value.user!.uid,
                            emailAddress: _emailcontroller.text,
                            fullName: _namecontroller.text,
                          ));
                          _namecontroller.clear();
                          _emailcontroller.clear();
                          _pwdcontroller.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User register successfully'),
                            ),
                          );
                        }).onError((error, stackTrace){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error.toString()),
                            ),
                          );
                        } );
                      }
                    },
                    child: CustomButton(
                      myText: "SIGN UP",
                      textFont: FontWeight.bold,
                      textSize: 15,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        myText: "Already have an account?",
                        textFont: FontWeight.w600,
                        textColor: AppConstantWidget.blackColor,
                        textSize: 12,
                        textSpaceing: 1,
                      ),
                      CustomText(
                        myText: "Login",
                        textFont: FontWeight.bold,
                        textColor: AppConstantWidget.appColor,
                        textSize: 12,
                        textSpaceing: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
