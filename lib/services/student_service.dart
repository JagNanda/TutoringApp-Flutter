import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutees";

  Future<dynamic> getFavouriteTutors() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");
    String tuteeId = sharedPrefs.getString("tuteeId");
    http.Response getResp = await http.get(
      "$baseUrl/favourite/$tuteeId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    if (getResp.statusCode == 200) {
      var favTutors = jsonDecode(getResp.body);
      return favTutors;
    }
    print("no favorite tutors found");
    return null;
  }

  Future<bool> addTutorToFavourites(String tutorId) async {
    bool success = false;
    //get token
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");

    //get tutee id
    String tuteeId = sharedPrefs.getString("tuteeId");
    //add tutor
    http.Response addTutorResp = await http.put(
      "$baseUrl/$tuteeId/tutors/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );

    if (addTutorResp.statusCode == 200) {
      success = true;
      print("added tutor to favourites");
    }

    return success;
  }

  Future<bool> removeTutorInFavourites(String tutorId) async {
    bool success = false;
    //get token
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");

    //get tutee id
    String tuteeId = sharedPrefs.getString("tuteeId");
    http.Response addTutorResp = await http.delete(
      "$baseUrl/$tuteeId/tutors/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );

    if (addTutorResp.statusCode == 200) {
      success = true;
      print("Removed tutor from favorites");
    }

    return success;
  }

  //get all current sessions for students
  Future<dynamic> getAllSessionRequests() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");
    String tuteeId = sharedPrefs.getString("tuteeId");

    http.Response getSessionsReq = await http.get(
      "$baseUrl/sessions/current/$tuteeId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );

    if (getSessionsReq.statusCode == 200) {
      var allCurrentSessions = jsonDecode(getSessionsReq.body);
      return allCurrentSessions;
    }

    return null;
  }
}
