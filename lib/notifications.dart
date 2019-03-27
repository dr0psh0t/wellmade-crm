import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'notif.dart';
import 'notificationlist.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Notif>> fetchNotif(http.Client client) async {
  final SharedPreferences prefs =await SharedPreferences.getInstance();
  
  String sessionId = prefs.getString("sessionId");
  int userId = prefs.getInt("userId");
  
  String cookie = 'JSESSIONID='+sessionId;
  String userIdStr = userId.toString();

  final uri = new Uri.http(
    '192.168.1.30:8080',
    '/wellmadecrm/getnotifications', {
      "userId":userIdStr,
      "sessionId":sessionId,
    }
  );

  var response = await http.post(uri, headers: {
    'Accept':'application/json',
    'Cookie':cookie,
  });

  if (response == null) {

  } 
  else if (response.statusCode == 200) {
    return compute(parseData, response.body);
  } 
  else {

  }
}

List<Notif> parseData(String responseBody) {  
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Notif>((json) => new Notif.fromJson(json)).toList();
}

class NotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationsState();
  }
}

class NotificationsState extends State<NotificationsPage> with AutomaticKeepAliveClientMixin<NotificationsPage> {
  @override
  bool get wantKeepAlive => true;
  int page = 1;
  var text;

  Future<List<Notif>> notificationFuture;

  @override
  void initState() {
    notificationFuture = fetchNotif(new http.Client());
    super.initState();
    text =page.toString()+' of 10';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Refresh Notifications',
            onPressed: () {
              setState(() {
                notificationFuture = fetchNotif(new http.Client());
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Notif>>(
        future: notificationFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return NotifList(
              notif: snapshot.data, 
              row: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (page < 2) {
                          page = 1;
                        }
                        else {
                          page--;
                          notificationFuture = fetchNotif(new http.Client());
                        }
                        text =page.toString()+' of 10';
                      });
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (page > 9) {
                          page = 10;
                        }
                        else {
                          page++;
                          notificationFuture = fetchNotif(new http.Client());
                        }
                        text =page.toString()+' of 10';
                      });
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            );
          }
          else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}