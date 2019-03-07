import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'history.dart';
import 'historylist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

Future<List<History>> fetchHistories(http.Client client) async {
  final response = await client.get('http://192.168.1.30:8080/mcsa/gethistory');
  return compute(parseData, response.body);
}

List<History> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<History>((json) => new History.fromJson(json)).toList();
}

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: FutureBuilder<List<History>>(
        future: fetchHistories(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          print('snapshot_histories:');
          print(snapshot.data);

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