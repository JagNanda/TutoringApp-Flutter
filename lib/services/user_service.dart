import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/models/registration_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl = "http://10.0.2.2:5000/api";

  //login user using email and password and store token in sharedPrefs
  Future<bool> loginUser({String email, String password}) async {
    bool success = false; //bool to see if token successfully stored
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
      var json = jsonDecode(resp.body);
      String token = json['token'];

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString("token", token).then((value) => (success = value));
    } else {
      print(resp.statusCode);
    }
    return success;
  }

  Future<bool> registerUser(RegistrationInfo userInfo) async {
    bool success = false;
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
      success = true;
      //TODO: add tutor profile using userid. Currently backend only returns the token
      // var json = jsonDecode(resp.body);
      // String token = json["token"];
      // http.Response resp2 = await http.post("http://localhost:5000/api/tutees/$token");
    } else {
      print(resp.statusCode);
    }
    return success;
  }
}
