import 'package:flutter/material.dart';
import 'joborders.dart';
import 'notifications.dart';
import 'histories.dart';
import 'options.dart';

class MainMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Menu',
      home: MainMenuPage(),
    );
  }
}

class MainMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenuPage> {
  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            bottomSelectedIndex = index; 
          });
        },
        children: <Widget>[
          JoborderWidget(),
          NotificationsWidget(),
          HistoryWidget(),
          OptionsWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          setState(() {
            bottomSelectedIndex = index;
            pageController.animateToPage(
              index, 
              duration: Duration(
                milliseconds: 500
              ), 
              curve: Curves.ease
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('JO'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Options')
          ),
        ],
      ),
    );
  }
}