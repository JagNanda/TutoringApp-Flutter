import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/registration_info.dart';
import 'package:tutoring_app_flutter/services/user_service.dart';
import 'package:validators/validators.dart' as validator;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String username;
  String email;
  String password;
  String firstName;
  String lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(30),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      RegisterTextFormField(
                        hint: "Email",
                        icon: Icons.mail,
                        isEmail: true,
                        onChange: (text) {
                          email = text;
                        },
                      ),
                      RegisterTextFormField(
                        hint: "Username",
                        icon: Icons.person,
                        onChange: (text) {
                          username = text;
                        },
                      ),
                      RegisterTextFormField(
                        hint: "Password",
                        icon: Icons.lock,
                        isPassword: true,
                        onChange: (text) {
                          password = text;
                        },
                      ),
                      RegisterTextFormField(
                        hint: "First Name",
                        icon: Icons.text_format,
                        isName: true,
                        onChange: (text) {
                          firstName = text;
                        },
                      ),
                      RegisterTextFormField(
                        hint: "Last Name",
                        icon: Icons.text_format,
                        isName: true,
                        onChange: (text) {
                          lastName = text;
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print("valid");
                              RegistrationInfo userDetails = RegistrationInfo(
                                email: email,
                                username: username,
                                firstName: firstName,
                                lastName: lastName,
                                password: password,
                              );
                              var registered = await UserService().registerUser(userDetails);
                              Navigator.pop(context, registered);
                            }
                          },
                          padding: EdgeInsets.all(20),
                        ),
                        width: double.maxFinite,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RegisterTextFormField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool isName;
  final bool isEmail;
  final IconData icon;
  final Function onChange;

  RegisterTextFormField(
      {@required this.hint,
      @required this.icon,
      @required this.onChange,
      this.isPassword = false,
      this.isEmail = false,
      this.isName = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          hintText: hint,
          prefixIcon: Icon(icon),
          labelText: hint,
        ),
        obscureText: isPassword == true ? true : false,
        showCursor: false,
        validator: (val) {
          if (val.isEmpty) {
            return "Please enter a value";
          }
          if (isEmail && !validator.isEmail(val)) {
            return "Please Enter a valid email";
          } else if (isName && !validator.isAlpha(val)) {
            return "Please enter a valid name";
          }
          return null;
        },
        onChanged: onChange,
      ),
    );
  }
}
