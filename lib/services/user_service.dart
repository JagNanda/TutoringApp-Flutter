import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/models/registration_info.dart';

class UserService {
  final String baseUrl = "http://10.0.2.2:5000/api/users";

  Future registerUser(RegistrationInfo userInfo) async {
    http.Response resp = await http.post(
      baseUrl + "/register",
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
