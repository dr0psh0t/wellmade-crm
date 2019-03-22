import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'register_screen.dart';
import 'main_menu.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';
import 'dart:convert';
import 'package:validate/validate.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: LoginPage(),
      routes: {
        "/reg": (_) => RegisterScreen(),
        "/mainmenu": (_) => MainMenuApp(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _saving = false;

  final _scaffoldKey =GlobalKey<ScaffoldState>();

  final controllerEmailUsername =TextEditingController();
  final controllerPassword =TextEditingController();

  void showPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    controllerEmailUsername.text =prefs.getString('email');
    controllerPassword.text =prefs.getString('password');
  }

  void initState() {
    showPrefs();
  }

  Widget buildWidget() {

    double screenW =MediaQuery.of(context).size.width;
    double screenH =MediaQuery.of(context).size.height;

    double logoH =screenH * 0.45;
    double percentDecrease =(screenH - logoH) / screenH;
    double logoW =screenW - (screenW - (screenW * percentDecrease));

    return Container(
      height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: logoW,
                height: logoH,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/wmdc_logo.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                "Email or Username",
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
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmailUsername,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(64),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
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
                      controller: controllerPassword,
                      obscureText: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
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
                      color: Color(0xFF4aa0d5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {

                        String email =controllerEmailUsername.text;
                        String password =controllerPassword.text;

                        if (email.isEmpty) {
                          return getDialog('Email is required.');
                        }

                        try {
                          Validate.isEmail(email);
                        } catch (e) {
                          return getDialog('Invalid email address format.');
                        }

                        if (password.isEmpty) {
                          return getDialog('Password is required.');
                        }

                        var params = {
                          'email':email,
                          'password':password,
                        };

                        login(params);
                      },
                    ),
                  ),
                ],
              ),
            ),
            //  container 
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
                          style: TextStyle(color: Color(0xFF4aa0d5)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/reg");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        child: buildWidget(),
        inAsyncCall: _saving,
      ),
    );
  }

  saveCredentials(
    String email, 
    String password, 
    int userId, 
    String sessionId,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("email", email);
    await prefs.setString("password", password);
    await prefs.setInt("userId", userId);
    await prefs.setString("sessionId", sessionId);
  }

  Future<String> login(var params) async {
    try {
      setState(() {
        _saving = true;
      });

      final uri = new Uri.http(
        '192.168.1.30:8080',
        '/wellmadecrm/login',
        params
      );

      var response = await http.post(uri, headers: {
        'Accept':'application/json'
      });

      if (response == null) {
        showSnackbar('Unable to create response object. Cause: null.', 'OK', false);
        closeModalHUD();
      } else if (response.statusCode != 200) {
        showSnackbar('Status code is not ok.', 'OK', false);
        closeModalHUD();
      } else {
        closeModalHUD();
        var result = json.decode(response.body);
        if (result['success']) {
          saveCredentials(
            controllerEmailUsername.text,
            controllerPassword.text,
            result['userId'],
            result['sessionId'],
          );
          Navigator.of(context).pushReplacementNamed('/mainmenu');
        } else {
          showSnackbar(result['reason'], 'OK', false);
        }
      }
    }
    catch (e) {
      closeModalHUD();
      if (e.runtimeType.toString() == 'SocketException') {
        showSnackbar('Unable to create connection to the server.', 'OK', false);
      } else {
        print(e.toString());
        showSnackbar(e.toString(), 'OK', false);
      }     
    }
  }

  void closeModalHUD() {
    setState(() {
      _saving = false;
    });
  }

  void showSnackbar(String msg, String label, bool popable) {

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
          label: label,
          onPressed: () {
            if (popable) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }

  Future getDialog(String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}