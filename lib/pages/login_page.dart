import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/portal_page.dart';
import 'package:tutoring_app_flutter/pages/registration_page.dart';
import '../services/user_service.dart';

class LoginPage extends StatefulWidget {

  LoginPage();
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
                  onPressed: () async {
                    //TODO: Uncomment after presentation
                    UserService userService = new UserService();
                    bool success = await userService.loginUser(email: email, password: password);
                    if (success) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PortalPage(),
                      settings: RouteSettings(name: '/portal',),
                      ));
                    }
                    /*onPressed: ()  {//TODO remove
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PortalPage(tutorProfile)));
                  },*/
                  }),
            ),
            Builder(builder: (BuildContext context) {
              return FlatButton(
                child: Text(
                  'Don\'t have an account? Sign up here',
                  style: TextStyle(color: Colors.purple, fontSize: 15),
                ),
                onPressed: () async {
                  bool registered = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                  if (registered == true) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("You are now registered!")));
                  }
                },
              );
            })
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
