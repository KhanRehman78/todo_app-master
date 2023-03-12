import 'package:flutter/material.dart';


import 'account_setting.dart';
import 'add_task.dart';
import 'complete_task.dart';
import 'home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int _selectedIndex = 0;

List Screens = [
  HomeScreen(),
  AddTask(),
  AccountSetting(),
];

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Screens[_selectedIndex],
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.symmetric(horizontal:20,vertical: 20),
          child: BottomNavigationBar(

            elevation:5 ,


            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(

                icon: Icon(Icons.home_outlined),
                label:"Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_sharp),
                label:"Add"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),label:"Person"
              ),
            ],
          ),
        ));
  }
}
