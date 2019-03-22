import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'joborder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:transparent_image/transparent_image.dart';

class JoborderList extends StatelessWidget {
  final List<Joborder> joborders;

  JoborderList({Key key, this.joborders});

  int joborderLength() {
    if (joborders == null) {
      return 0;
    }
    else {
      return joborders.length;
    }
  } 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: joborderLength(),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Text(
                        joborders[index].joNo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //  aligns columns to left
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Model: '),
                          Text(joborders[index].model),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Make: '),
                          Text(joborders[index].make),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Category: '),
                          Text(joborders[index].category),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Serial: '),
                          Text(joborders[index].serial),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('CSA: '),
                          Text(joborders[index].csa),
                        ],
                      ),
                    ],
                  ),
                ),

                //  message & emails
                Row(
                  children: <Widget>[
                    Expanded( 
                      child: FlatButton(
                        color: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          child: ButtonTheme.bar(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Icons.message),
                                  onPressed: () {
                                    _textMe();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        onPressed: () {
                          _textMe();
                        }, 
                      ),
                    ),

                    Container(
                      height: 40.0,
                      width: 2.0,
                      color: Colors.blue,
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    ),

                    Expanded(
                      child: FlatButton(
                        color: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          child: ButtonTheme.bar(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center, 
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(Icons.email),
                                  onPressed: () {
                                    _sendMail();
                                  },
                                ),
                              ],
                            ),
                          ),

                        ),
                        onPressed: () {
                          _sendMail();
                        },
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  _sendMail() async {
    // Android and iOS
    const uri = 'mailto:test@example.org?subject=123456&body=Crankshaft';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch uri';
    }
  }

  _textMe() async {
    const uri = 'sms:+39 349 060 888';
    if (await canLaunch(uri)) {
      await launch(uri);
    } 
    else {
      // iOS
      const uri = 'sms:0039-222-060-888';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}