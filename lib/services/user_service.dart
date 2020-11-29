import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/models/registration_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final String baseUrl = "http://10.0.2.2:5000/api";

  //check if user has a tutor profile
  Future<bool> hasTutorProfile() async {
    bool hasTutorProfile = false;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString("userId");
    String token = preferences.getString("token");
    http.Response resp = await http.get(
      baseUrl + "/users/$userId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    if (resp.statusCode == 200) {
      var json = jsonDecode(resp.body);
      if (json["tutorId"] != null) {
        print("field exists");
        hasTutorProfile = true;
      } else {
        print("does not exist");
        hasTutorProfile = false;
      }
    }
    return hasTutorProfile;
  }

  //login user using email and password and store token, userId, and tuteeId in sharedPrefs
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

      //get user and save userId and tuteeId to prefences
      http.Response userIdResponse = await http.get(
        "$baseUrl/auth",
        headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
      ).catchError((err) => print("header err $err"));
      if (userIdResponse.statusCode == 200) {
        success = true;
        var user = jsonDecode(userIdResponse.body);
        sharedPrefs.setString("userId", user["_id"]);
        sharedPrefs.setString("tuteeId", user["tuteeId"]);
      }
    } else {
      print(resp.statusCode);
    }

    return success;
  }

  //register user, get their id and create a student profile for them
  Future<bool> registerUser(RegistrationInfo userInfo) async {
    bool success = false;
    http.Response resp = await http.post(
      "$baseUrl/users/register",
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

      //user token to get their userid
      var body = jsonDecode(resp.body);
      String token = body["token"];
      print(token);

      http.Response userIdResponse = await http.get(
        "$baseUrl/auth",
        headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
      ).catchError((err) => print("header err $err"));


      if (userIdResponse.statusCode == 200) {

        var user = jsonDecode(userIdResponse.body);
        var userId = user["_id"];
        print("auth success: $userId");

        http.Response profileResponse = await http.post(
          "$baseUrl/tutees/$userId",
          headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
        );


        if (profileResponse.statusCode == 200) {
          success = true;
        } else {
          print(profileResponse.statusCode);
          print(profileResponse.body);
        }
      }
    } else {
      print(resp.statusCode);
    }
    return success;
  }
}
