import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'notif.dart';

class NotifList extends StatelessWidget {
  final List<Notif> notif;
  Row row;

  NotifList({Key key, this.notif, this.row,});

  int getNotifLength() {
    if (notif ==null) {
      return 0;
    }
    else {
      return notif.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: row,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.0),
          child: ListView.separated(
            itemCount: getNotifLength(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  notif[index].item,
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        notif[index].joNo,
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
              );
            },
            padding: EdgeInsets.only(top: 10.0),
            separatorBuilder: (context, index) => Divider(
                color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}