import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'history.dart';
import 'historylist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<History>> fetchHistories(http.Client client) async {
  final SharedPreferences prefs =await SharedPreferences.getInstance();

  String sessionId = prefs.getString("sessionId");
  int userId = prefs.getInt("userId");
  
  String cookie = 'JSESSIONID='+sessionId;
  String userIdStr = userId.toString();

  final uri = new Uri.http(
    '192.168.1.30:8080',
    '/wellmadecrm/gethistory', {
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

List<History> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<History>((json) => new History.fromJson(json)).toList();
}

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History',
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HistoryState();
  }
}

class HistoryState extends State<HistoryPage> with AutomaticKeepAliveClientMixin<HistoryPage> {
  @override
  bool get wantKeepAlive => true;

  Future<List<History>> historyFuture;

  @override
  void initState() {
    super.initState();
    historyFuture = fetchHistories(new http.Client());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Histories'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Refresh Histories',
            onPressed: () {
              setState(() {
                historyFuture = fetchHistories(new http.Client());
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<History>>(
        future: historyFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return HistoryList(histories: snapshot.data);
          }
          else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}