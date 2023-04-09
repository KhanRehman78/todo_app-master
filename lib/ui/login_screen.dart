import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_app/infrastructure/services/auth_services.dart';
import 'package:todo_app/ui/sign_up.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfromfield.dart';
import 'bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _pwdcontroller = TextEditingController();
final _formkey = GlobalKey<FormState>();
bool obsecure = true;
AuthServices _authServices = AuthServices();

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading:  isLoading,
        child: SingleChildScrollView(
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
                      myText: "Login",
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        myText: "Forgot Password",
                        textFont: FontWeight.w600,
                        textColor: AppConstantWidget.appColor,
                        textSize: 12,
                        textSpaceing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          makeLoadingTrue();
                          _authServices
                              .loginUser(
                                  email: _emailcontroller.text,
                                  password: _pwdcontroller.text)
                              .then((value) {
                                makeLoadingFalse();

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Successfully Login!")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNavBar()));
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text(error.toString())));
                          });
                        }
                      },
                      child: CustomButton(
                        myText: "LOGIN",
                        textFont: FontWeight.bold,
                        textSize: 15,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          myText: "Don't have an account?",
                          textFont: FontWeight.w600,
                          textColor: AppConstantWidget.blackColor,
                          textSize: 12,
                          textSpaceing: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: CustomText(
                            myText: "SIGN UP",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.appColor,
                            textSize: 12,
                            textSpaceing: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  makeLoadingTrue() {
    setState(() {
      isLoading = true;
    });
  }

  makeLoadingFalse() {
    setState(() {
      isLoading = false;
    });
  }
}
