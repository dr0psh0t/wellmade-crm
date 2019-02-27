import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Text('More'),
    );
  }
}