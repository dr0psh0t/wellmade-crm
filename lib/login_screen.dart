import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_page.dart';
import 'main_menu.dart';

class LoginScreen1 extends StatelessWidget {

  /*
  final Color primaryColor;
  final Color backgroundColor;
  final AssetImage backgroundImage;

  LoginScreen1({
    Key key,
    this.primaryColor, this.backgroundColor, this.backgroundImage
  });*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset('assets/images/wmdc_logo.png'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
              child: Text(
                "Email",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Password",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  new Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.lock_open,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //  container login
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      splashColor: Colors.blue,
                      //color: Colors.blue,
                      color: Color(0xFF4aa0d5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            //padding: const EdgeInsets.only(left: 20.0),
                            padding: const EdgeInsets.all(17.0),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          /*
                          new Expanded(
                            child: Container(),
                          ),

                          new Transform.translate(
                            offset: Offset(15.0, 0.0),
                            child: new Container(
                              padding: const EdgeInsets.all(5.0),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward,
                                  //color: this.primaryColor,p
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainMenu(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          */

                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainMenu(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //  container register
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "REGISTER",
                          //style: TextStyle(color: this.primaryColor),
                          style: TextStyle(color: Color(0xFF4aa0d5)),
                        ),
                      ),
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(
                              primaryColor: Color(0xFF4aa0d5),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        );

                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}