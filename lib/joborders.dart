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
      //showSnackbar('CANNOT FILL JOBORDERS. RESPONSE IS NULL.', 'Null');
      print('CANNOT FILL JOBORDERS. RESPONSE IS NULL.');
    } 

    if (response.statusCode == 200) {
      return compute(parseData, response.body);
    } 
    else {
      //showSnackbar('Reponse is not OK', response.statusCode.toString());
      print('Reponse is not OK');
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
  final _scaffoldKey =GlobalKey<ScaffoldState>();
  int page = 1;
  var text;

  Future<List<Joborder>> joborderFuture;

  @override
  void initState() {
    joborderFuture = fetchJoborders(new http.Client());
    super.initState();
    text =page.toString()+' of 10';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Joborders'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              setState(() {
                joborderFuture = fetchJoborders(new http.Client());
              });
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
            return JoborderList(
              joborders: snapshot.data, 
              row: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        if (page < 2) {
                          page = 1;
                        }
                        else {
                          page--;
                          joborderFuture = fetchJoborders(new http.Client());
                        }
                        text =page.toString()+' of 10';
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    label: Text('Prev'),
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
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        if (page > 9) {
                          page = 10;
                        }
                        else {
                          page++;
                          joborderFuture = fetchJoborders(new http.Client());
                        }
                        text =page.toString()+' of 10';
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    label: Text('Next'),
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