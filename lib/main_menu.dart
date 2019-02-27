import 'package:flutter/material.dart';
import 'home_page.dart';
import 'notifications.dart';
import 'history.dart';
import 'options.dart';
import 'custom_bar.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePageWidget(),
    NotificationsWidget(),
    HistoryWidget(),
    //OptionsWidget(),
    CustomBarWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'JO',
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(
              'History',
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(
              'Options',
              style: TextStyle(
                fontSize: 12.0
              ),
            ),
          ),

        ],
      ),
    );
  }
}