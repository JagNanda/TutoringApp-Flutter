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

  //check if user has tutor profile
  Future<dynamic> tutorProfileCheck(String userId) async {
    http.Response userResp = await http.get("$baseUrl/users/$userId");
    if (userResp.statusCode == 200) {
      var user = jsonDecode(userResp.body);
      print(user.runtimeType);
      return user;
    }
    return userResp.statusCode;
  }

  //get favorite tutor posts
  Future<dynamic> getFavouritePosts() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");
    String tutorId = sharedPrefs.getString("tutorId");
    http.Response getResp = await http.get(
      "$baseUrl/favourite/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    if (getResp.statusCode == 200) {
      var favPosts = jsonDecode(getResp.body);
      return favPosts;
    }
    print("no favorite posts found");
    return null;
  }

  //add a favorite post to a tutor
  Future<bool> addStudentPostToTutorFavorites(String postId) async {
    bool success = false;
    final sharedPrefs = await SharedPreferences.getInstance();
    String tutorId = sharedPrefs.getString("tutorId");
    String token = sharedPrefs.getString("token");
    http.Response addPostResp = await http.put(
      "$baseUrl/post/$postId/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    if (addPostResp.statusCode == 200) {
      success = true;
    }
    return success;
  }

  Future<bool> removeFavoritePostFromTutor(String postId) async {
    bool success = false;
    final sharedPrefs = await SharedPreferences.getInstance();
    String tutorId = sharedPrefs.getString("tutorId");
    String token = sharedPrefs.getString("token");
    http.Response remPostResp = await http.delete(
      "$baseUrl/post/$postId/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    print(remPostResp.statusCode);
    if (remPostResp.statusCode == 200) {
      success = true;
    }
    return success;
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
