import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TutorService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutors";
  final sharedPrefs = SharedPreferences.getInstance();

  Future<dynamic> getTutorProfiles() async {
    http.Response tutorProfilesResp = await http.get("$baseUrl/all");
    if (tutorProfilesResp.statusCode == 200) {
      var allPosts = jsonDecode(tutorProfilesResp.body);
      return allPosts;
    }
    return tutorProfilesResp.statusCode;
  }

  //can include a comma seperated list with subjects to search for
  Future<dynamic> getTutorProfilesBySubject(String subject) async {
    http.Response tutorProfilesResp = await http.get("$baseUrl/all/$subject");
    if (tutorProfilesResp.statusCode == 200) {
      var allPosts = jsonDecode(tutorProfilesResp.body);
      return allPosts;
    }
    return tutorProfilesResp.statusCode;
  }

  Future<dynamic> tutorProfileCheck(String userId) async {
    http.Response userResp = await http.get("$baseUrl/users/$userId");
    if (userResp.statusCode == 200) {
      var user = jsonDecode(userResp.body);
      print(user.runtimeType);
      return user;
    }
    return userResp.statusCode;
  }
}

/*
* final sharedPrefs = await SharedPreferences.getInstance();

          http.Response userIdResponse = await http.get(
          "$baseUrl/auth",
          headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
          ).catchError((err) => print("header err $err"));
          if (userIdResponse.statusCode == 200) {
          success = true;
          var user = jsonDecode(userIdResponse.body);
          sharedPrefs.setString("userId", user["_id"]);
          sharedPrefs.setString("tuteeId", user["tuteeId"]);
*
*
* */
