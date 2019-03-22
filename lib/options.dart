import 'package:flutter/material.dart';
import 'login_screen.dart';

class OptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options',
      home: OptionsPage(),
      routes: {
        "/login": (_) => LoginScreen(),
      },
    );
  }
}

class OptionsPage extends StatefulWidget {
  @override
  OptionsPageState createState() => new OptionsPageState();
}

class OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            tooltip: 'Options',
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                .pushReplacement(MaterialPageRoute(builder: (context) => new LoginScreen()));
            },
          ),
        ],
      ),
      body: Text(
        'Options',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}