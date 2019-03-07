import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        automaticallyImplyLeading: false,
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