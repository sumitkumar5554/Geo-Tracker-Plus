import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotracker/Managers%20Features/manager_dashboard_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/profile_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/setting_screen.dart';

import '../Sales Team Feature/dashboard.dart';

class ManagerNavbar extends  StatefulWidget{
  @override
  State<ManagerNavbar> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<ManagerNavbar> {

  int _selectedIndex = 0;
  final screens = [
    // Home screen
    ManagerDashboardScreen (),
    // // Message screen
    // MessagesScreen(),
    // Schedule screen
    ProfileScreen(),
    // Settings screen
    SettingScreen(),
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;

            });

          },
          items: [
            BottomNavigationBarItem
              (icon:Icon(Icons.home_filled),
              label: "Home",
            ),
            // BottomNavigationBarItem(
            //   icon:Icon(CupertinoIcons.chat_bubble_text_fill),
            //   label: "Messages",
            // ),
            BottomNavigationBarItem(
              icon:Icon(Icons.person),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.home_filled),
              label: "Settings",

            ),

          ],

        ),
      ),
    );
  }
}