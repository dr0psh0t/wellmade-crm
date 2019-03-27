import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'history.dart';
import 'jo_info.dart';

class HistoryList extends StatelessWidget {
  final List<History> histories;
  Row row;

  HistoryList({Key key, this.histories, this.row,});

  int historyLength() {
    if (histories ==null) {
      return 0;
    }
    else {
      return histories.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: row,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.0),
          child: ListView.separated(
            itemCount: historyLength(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  var builder = PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context, 
                      Animation<double> animation, 
                      Animation<double> secondaryAnimation) {
                      return JoInfoWidget();
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
                child: ListTile(
                  title: Text(
                    histories[index].item,
                    style: TextStyle(
                      fontSize: 18.0
                    ),
                  ),
                  subtitle: Column(
                    children: <Widget>[

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          histories[index].joNo,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          histories[index].date,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),

                    ],
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right, color: Colors.black54, size: 30.0
                  ),
                ),
              );
            },
            padding: EdgeInsets.only(top: 10.0),
            separatorBuilder: (context, index) => Divider(
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}