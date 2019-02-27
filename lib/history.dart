import 'package:flutter/material.dart';
import 'jo_info.dart';

class HistoryWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),

      /*
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: historyCard,
      ),*/

      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black26,
        ),
        itemCount: 20,
        itemBuilder: historyCard,
      ),

    );
  }
}

Widget historyCard(BuildContext context, int index) {

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
        'Crankshaft',
        style: TextStyle(
          fontSize: 18.0
        ),
      ),
      subtitle: Column(
        children: <Widget>[

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              //'12345 - ' + DateTime.now().toString().split(".")[0],
              '12345',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DateTime.now().toString().split(".")[0],
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