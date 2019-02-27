import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    //home: LoginScreen1(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() { 
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: LoginScreen1(),
      title: Text('Customer',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.blue,
        ),
      ),
      //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      image: Image.asset('assets/images/wmdc_logo.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 300.0,
      onClick: ()=>print("Flutter"),
      loaderColor: Colors.blue
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text("Welcome In SplashScreen Package"),
      automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Done!",
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0
          ),
        ),
      ),
    );
  }
}