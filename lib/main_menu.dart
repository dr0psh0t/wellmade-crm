import 'package:flutter/material.dart';
import 'joborders.dart';
import 'notifications.dart';
import 'histories.dart';
import 'options.dart';
import 'login_screen.dart';

class MainMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainMenu',
      home: MainMenuPage(),
      routes: {
        "/login": (_) => LoginScreen(),
      },
    );
  }
}

class MainMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenuPage> with AutomaticKeepAliveClientMixin<MainMenuPage> {
  @override
  bool get wantKeepAlive => true;

  int bottomSelectedIndex = 0;

  var titles = ['Joborders', 'Notifications', 'History', 'Options'];
  var appbarTitle = '';

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
    appbarTitle =titles[0];
  }

  var appBarList;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            bottomSelectedIndex = index; 
            appbarTitle = titles[bottomSelectedIndex];
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
            title: Text('Options'),
          ),
        ],
      ),
    );
  }
}