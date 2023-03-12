import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150,),
              Center(
                  child:
               Lottie.asset("assets/lotte/41478-todo-en-cuotas-splash.json"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
