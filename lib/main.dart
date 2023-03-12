import 'package:flutter/material.dart';


import 'ui/front_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home:FrontPage() ,
      //home:LoginScreen(),
      //home:SignUpScreen(),
      //home:ForgotPassword() ,
     //home:AddTask(),
      //home:CustomStackContainer() ,
      //home:EditProfile(),
      //home:AccountSetting() ,
      //home:HomeScreen() ,
      //home:BottomNavBar()  ,
    );
  }
}

