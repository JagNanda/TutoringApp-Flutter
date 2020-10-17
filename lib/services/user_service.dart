import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/models/registration_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl = "http://10.0.2.2:5000/api";

  //login user using email and password and store token in sharedPrefs
  Future loginUser({String email, String password}) async {
    http.Response resp = await http.post(
      baseUrl + "/auth/login",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (resp.statusCode == 200) {
      print("login successful");
      var json = jsonDecode(resp.body);
      String token = json['token'];

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs
          .setString("token", resp.body)
          .then((value) => print("stored token: $value"));
    } else {
      print(resp.statusCode);
    }
  }

  Future registerUser(RegistrationInfo userInfo) async {
    http.Response resp = await http.post(
      baseUrl + "/users/register",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': userInfo.username,
        'firstName': userInfo.firstName,
        'lastName': userInfo.lastName,
        'email': userInfo.email,
        'password': userInfo.password,
      }),
    );
    if (resp.statusCode == 200) {
      print("ok");
      return jsonDecode(resp.body);
    } else {
      print(resp.statusCode);
    }
  }
}
