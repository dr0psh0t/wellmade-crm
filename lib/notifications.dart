import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'notif.dart';
import 'notificationlist.dart';
import 'package:http/http.dart' as http;

Future<List<Notif>> fetchNotif(http.Client client) async {
  final response = await client.get('http://192.168.1.30:8080/mcsa/getnotifications');
  return compute(parseData, response.body);
}

List<Notif> parseData(String responseBody) {  
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Notif>((json) => new Notif.fromJson(json)).toList();
}

class NotificationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: FutureBuilder<List<Notif>>(
        future: fetchNotif(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return NotifList(notif: snapshot.data);
          }
          else {
            return Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}