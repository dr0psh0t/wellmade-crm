import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:validate/validate.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State createState() => new RegisterState();
}

class RegisterState extends State<RegisterScreen> {
  bool _saving = false;

  final Color primaryColor = Color(0xFF4aa0d5);
  final Color backgroundColor = Colors.white;

  final usernameController = TextEditingController();
  final accountNumberController =TextEditingController();
  final passwordController =TextEditingController();
  final repeatPasswordController =TextEditingController();
  final emailController =TextEditingController();

  final _scaffoldKey =GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  Widget buildRegisterWidget() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: this.backgroundColor,
      ),
      child: ListView(
        children: <Widget>[          
          //  USERNAME FIELD
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              "Username",
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    controller:usernameController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
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
              "Account #",
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
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.confirmation_number,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    controller: accountNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Account #',
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
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(32),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Repeat Password",
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
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextFormField(
                    controller: repeatPasswordController,
                    obscureText: true,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(32),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Repeat Password',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
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
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                Expanded(
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(64),
                    ],
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

          Container(
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                    splashColor: this.primaryColor,
                    //color: this.primaryColor,
                    color: Colors.blue,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                      ],
                    ),
                    onPressed: () {

                      String username =usernameController.text;
                      String accountNo =accountNumberController.text;
                      String password =passwordController.text;
                      String repeatPassword =repeatPasswordController.text;
                      String email =emailController.text;

                      if (username.isEmpty) {
                        return getDialog('Username is required.');
                      }
                      else if (username.length < 5 || username.length > 16) {
                        return getDialog('Username length must be between 8 and 16.');
                      }

                      if (accountNo.isEmpty) {
                        return getDialog('Account No is required.');
                      }

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

                      if (repeatPassword.isEmpty) {
                        return getDialog('Repeat Password is required.');
                      }

                      if (password !=repeatPassword) {
                        return getDialog('Password and Repeat Password do not match.');
                      }

                      var params = {
                        'username':username,
                        'accountNo':accountNo,
                        'email':email,
                        'password':password,
                        'repeatPassword':repeatPassword,
                      };
                      
                      register(params);
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
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: ModalProgressHUD(
        child: buildRegisterWidget(),
        inAsyncCall: _saving,
      ),
    );
  }

  Future<String> register(var params) async {
    
    try {
      setState(() {
        _saving = true;
      });

      final uri = new Uri.http(
        '192.168.1.30:8080',
        '/wellmadecrm/register',
        params
      );

      var response = await http.post(uri, headers: {
        'Accept':'application/json'
      });

      //  close modal progress hud
      setState(() {
        _saving = false;
      });

      if (response == null) {
        showSnackbar('Unable to create response object. Cause: null.', 'OK', false);
      }
      else if (response.statusCode != 200) {
        showSnackbar('Status code is not ok.', 'OK', false);
      }
      else {
        var result = json.decode(response.body);
        if (result['success']) {
          usernameController.text = '';
          accountNumberController.text = '';
          passwordController.text = '';
          repeatPasswordController.text = '';
          emailController.text = '';
          showSnackbar('Successfully registered!', 'Login', true);
        }
        else {
          showSnackbar(result['reason'], 'OK', false);
        }
      }
    }
    catch (e) {
      if (e.runtimeType.toString() == 'SocketException') {
        showSnackbar('Unable to create connection to the server.', 'OK', false);
      }
      else {
        print(e.toString());
        showSnackbar(e.toString(), 'OK', false);
      }
    }
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
