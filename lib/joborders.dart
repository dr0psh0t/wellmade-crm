import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'joborder.dart';
import 'joborderlist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

Future<List<Joborder>> fetchJoborders(http.Client client) async {
  final response = await client.get('http://192.168.1.30:8080/mcsa/getjoborders');
  print(response.body);
  return compute(parseData, response.body);
}

List<Joborder> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Joborder>((json) => new Joborder.fromJson(json)).toList();
}

class JoborderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joborders'),
      ),
      body: FutureBuilder<List<Joborder>>(
        future: fetchJoborders(new http.Client()),
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