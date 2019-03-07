import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'joborder.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(5.0),

      itemCount: joborderLength(),
      //itemCount: 20,

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
                        //'12345',
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
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,

                      image: NetworkImage(joborders[index].imageSrc),
                      //image: NetworkImage('https://images.rallysportdirect.com/image/private/s--BTSophVj--/f_auto,t_auto_rsd_product/v1436916986/product_images/sub_12200aa430_1'),
                      //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/BMW_S65_Engine_Model.JPG/220px-BMW_S65_Engine_Model.JPG'),
                      //image: NetworkImage('https://clubrunner.blob.core.windows.net/00000050176/Images/Rotary-at-Work-Day-3(1).png'),
                      //image: NetworkImage('https://clubrunner.blob.core.windows.net/00000050143/Images/Are-you-using-the-right-Rotary-logo-.png'),
                    ),
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
}