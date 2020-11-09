import 'package:flutter/material.dart';

class RegistrationInfo {
  String username;
  String password;
  String email;
  String firstName;
  String lastName;

  RegistrationInfo(
      {@required this.username,
      @required this.password,
      @required this.email,
      @required this.firstName,
      @required this.lastName});
}
