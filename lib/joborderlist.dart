import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'joborder.dart';
import 'joborder_info.dart';
import 'package:url_launcher/url_launcher.dart'; 

class JoborderList extends StatelessWidget {
  final List<Joborder> joborders;
  Row row;

  JoborderList({Key key, this.joborders, this.row});

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
    return Stack(
      children: <Widget>[
        new Align(
          alignment: Alignment.bottomCenter,
          child: row,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.0),
          child: ListView.builder(
            padding: EdgeInsets.all(5.0),
            itemCount: joborderLength(),
            itemBuilder: (BuildContext context, int index) {
              var joNoHeader = Container(
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
              );

              var container = GestureDetector(
                onTap: () {
                  var builder = PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context, 
                      Animation<double> animation, 
                      Animation<double> secondaryAnimation) {
                      return JoborderInfoWidget(
                        joborders[index].joNo, 
                        joborders[index].imageSrc, 
                        joborders[index].model, 
                        joborders[index].make, 
                        joborders[index].category, 
                        joborders[index].serial, 
                        joborders[index].csa, 
                      );
                    },
                    transitionsBuilder: (
                      BuildContext context, 
                      Animation<double> animation, 
                      Animation<double> secondaryAnimation, 
                      Widget child) {
                        //if dx>0.0 and dy=0.0 then navigates from right if 
                        //dy>0.0 and dx= 0.0 then navigates from bottom 
                        //and durationInMillis is the speed of animation
                        return SlideTransition(
                          position: new Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: new SlideTransition(
                            position: new Tween<Offset>(
                              begin: Offset.zero,
                              end: const Offset(1.0, 0.0),
                            ).animate(secondaryAnimation),
                            child: child,
                          ),
                        );
                    },
                  );
                  Navigator.push(context, builder);
                },

                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 2.0, color: Colors.blue),
                      right: BorderSide(width: 2.0, color: Colors.blue),
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Model: ',
                                style: TextStyle(
                                  fontFamily: 'DroidSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Make: ',
                                style: TextStyle(
                                  fontFamily: 'DroidSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Category: ', 
                                style: TextStyle(
                                  fontFamily: 'DroidSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Serial: ', 
                                style: TextStyle(
                                  fontFamily: 'DroidSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'CSA: ', 
                                style: TextStyle(
                                  fontFamily: 'DroidSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              joborders[index].model, 
                              style: TextStyle(
                                fontFamily: 'DroidSans',
                              ),
                            ),
                            Text(
                              joborders[index].make, 
                              style: TextStyle(
                                fontFamily: 'DroidSans',
                              ),
                            ),
                            Text(
                              joborders[index].category, 
                              style: TextStyle(
                                fontFamily: 'DroidSans',
                              ),
                            ),
                            Text(
                              joborders[index].serial, 
                              style: TextStyle(
                                fontFamily: 'DroidSans',
                              ),
                            ),
                            Text(
                              joborders[index].csa, 
                              style: TextStyle(
                                fontFamily: 'DroidSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

              var footer = Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 2.0, color: Colors.blue),
                    right: BorderSide(width: 2.0, color: Colors.blue),
                    bottom: BorderSide(width: 2.0, color: Colors.blue),
                  ),
                ),
                child: Row(
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
                      height: 20.0,
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
              );

              return Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      joNoHeader,
                      container,
                      footer,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );

  

    /*
    return ListView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: joborderLength(),
      itemBuilder: (BuildContext context, int index) {
        var joNoHeader = Container(
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
        );

        var container = GestureDetector(
          onTap: () {
            var builder = PageRouteBuilder(
              pageBuilder: (
                BuildContext context, 
                Animation<double> animation, 
                Animation<double> secondaryAnimation) {
                return JoborderInfoWidget(
                  joborders[index].joNo, 
                  joborders[index].imageSrc, 
                  joborders[index].model, 
                  joborders[index].make, 
                  joborders[index].category, 
                  joborders[index].serial, 
                  joborders[index].csa, 
                );
              },
              transitionsBuilder: (
                BuildContext context, 
                Animation<double> animation, 
                Animation<double> secondaryAnimation, 
                Widget child) {
                  //if dx>0.0 and dy=0.0 then navigates from right if 
                  //dy>0.0 and dx= 0.0 then navigates from bottom 
                  //and durationInMillis is the speed of animation
                  return SlideTransition(
                    position: new Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: new SlideTransition(
                      position: new Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child,
                    ),
                  );
              },
            );
            Navigator.push(context, builder);
          },

          child: Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 2.0, color: Colors.blue),
                right: BorderSide(width: 2.0, color: Colors.blue),
              ),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Model: ',
                          style: TextStyle(
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Make: ',
                          style: TextStyle(
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Category: ', 
                          style: TextStyle(
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Serial: ', 
                          style: TextStyle(
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'CSA: ', 
                          style: TextStyle(
                            fontFamily: 'DroidSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        joborders[index].model, 
                        style: TextStyle(
                          fontFamily: 'DroidSans',
                        ),
                      ),
                      Text(
                        joborders[index].make, 
                        style: TextStyle(
                          fontFamily: 'DroidSans',
                        ),
                      ),
                      Text(
                        joborders[index].category, 
                        style: TextStyle(
                          fontFamily: 'DroidSans',
                        ),
                      ),
                      Text(
                        joborders[index].serial, 
                        style: TextStyle(
                          fontFamily: 'DroidSans',
                        ),
                      ),
                      Text(
                        joborders[index].csa, 
                        style: TextStyle(
                          fontFamily: 'DroidSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

        var footer = Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(width: 2.0, color: Colors.blue),
              right: BorderSide(width: 2.0, color: Colors.blue),
              bottom: BorderSide(width: 2.0, color: Colors.blue),
            ),
          ),
          child: Row(
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
                height: 20.0,
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
        );

        return Container(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                joNoHeader,
                container,
                footer,
              ],
            ),
          ),
        );
      },
    );*/
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