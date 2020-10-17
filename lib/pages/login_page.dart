import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/user_service.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70.0,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ),
            SizedBox(height: 50.0),
            LoginTextFormField(
              hint: "email",
              onChange: (text) {
                email = text;
              },
            ),
            SizedBox(height: 15.0),
            LoginTextFormField(
              hint: "password",
              isPassword: true,
              onChange: (text) {
                password = text;
              },
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(12),
                color: Colors.green,
                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 17.0)),
                onPressed: () {
                  UserService userService = new UserService();
                  userService.loginUser(email: email, password: password);
                },
              ),
            ),
            FlatButton(
              child: Text(
                'Don\'t have an account? Sign up here',
                style: TextStyle(color: Colors.purple, fontSize: 15),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final Function onChange;

  LoginTextFormField({this.isPassword, this.hint, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword == true ? true : false,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onChanged: onChange,
    );
  }
}
