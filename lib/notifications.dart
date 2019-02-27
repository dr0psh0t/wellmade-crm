import 'package:flutter/material.dart';
import 'jo_info.dart';

class NotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),

      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black26,
        ),
        itemCount: 20,
        itemBuilder: getNotifCard,
      ),

    );

  }
}

Widget getNotifCard(BuildContext context, int index) {

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => JoInfoWidget()
        ),
      );
    },
    child: ListTile(
      title: Text(
        'Piston Engine Valve',
        style: TextStyle(
          fontSize: 18.0
        ),
      ),
      subtitle: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '12345',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right, color: Colors.black54, size: 30.0
      ),
    ),
  );
}