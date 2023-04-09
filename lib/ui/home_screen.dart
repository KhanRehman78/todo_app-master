import 'package:flutter/material.dart';
import 'package:todo_app/ui/pending.dart';
import 'package:todo_app/ui/today_task.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_text.dart';
import 'all_task.dart';
import 'complete_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppConstantWidget.appColor,
          title: const Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          elevation:0 ,
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              borderSide: BorderSide(
                color: AppConstantWidget.appColor,
              )),
        ),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TabBar(
                  isScrollable: true ,
                 labelStyle: TextStyle(
                   fontSize:14,
                   fontWeight: FontWeight.bold
                 ),
                  physics:BouncingScrollPhysics() ,
                  indicatorColor:AppConstantWidget.appColor ,
                  padding: EdgeInsets.all(5),
                  labelColor: Colors.black,
                  tabs: [
                    Text("All Task"),
                    Text("Today Task"),
                    Text("Pending"),
                    Text("Complete Task"),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      AllTask(),
                      TodayTask(),
                      Pending(),
                      CompleteTask(),
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
