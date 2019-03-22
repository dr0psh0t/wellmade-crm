import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'joborder.dart';
import 'joborderlist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'main.dart';

Future<List<Joborder>> fetchJoborders(http.Client client) async {
  final SharedPreferences prefs =await SharedPreferences.getInstance();

  String sessionId = prefs.getString("sessionId");
  int userId = prefs.getInt("userId");
  
  String cookie = 'JSESSIONID='+sessionId;
  String userIdStr = userId.toString();

  final uri = new Uri.http(
    '192.168.1.30:8080',
    '/wellmadecrm/getjoborders', {
      "userId":userIdStr,
      "sessionId":sessionId,                                                                              
    }
  );

  var response = await http.post(uri, headers: {
    'Accept':'application/json',
    'Cookie':cookie,
  });

  if (response == null) {
    print('CANNOT FILL JOBORDERS. RESPONSE IS NULL.');
  } 

  if (response.statusCode == 200) {
    return compute(parseData, response.body);
  } 
  else {

  }
}

List<Joborder> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Joborder>((json) => new Joborder.fromJson(json)).toList();
}

class JoborderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joborder',
      home: JoborderPage(),
      routes: {
        "/login": (_) => LoginScreen(),
        "/main": (_) => MyApp(),
      },
    );
  }
}

class JoborderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JoborderState();
  }
}

class JoborderState extends State<JoborderPage> with AutomaticKeepAliveClientMixin<JoborderPage> {
  @override
  bool get wantKeepAlive => true;

  Future<List<Joborder>> joborderFuture;

  @override
  void initState() {
    joborderFuture = fetchJoborders(new http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Joborders'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              setState(() {
                joborderFuture = fetchJoborders(new http.Client());
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Joborder>>(
        future: joborderFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return JoborderList(joborders: snapshot.data);
          }
          else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}