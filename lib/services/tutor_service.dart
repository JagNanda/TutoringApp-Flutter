import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';

class TutorService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutors";
  final sharedPrefs = SharedPreferences.getInstance();

  //get a tutor profile by id
  Future<dynamic> getTutorById(String tutorId) async {
    http.Response tutorProfileResp = await http.get("$baseUrl/tutor/$tutorId");
    if (tutorProfileResp.statusCode == 200) {
      var profile = jsonDecode(tutorProfileResp.body);
      return profile;
    }
    return null;
  }

  //create a tutor
  Future<bool> createTutorProfile(TutorProfile profile) async {
    bool success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId");
    String token = prefs.getString("token");

    http.Response resp = await http.post(
      "$baseUrl/$userId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
      body: jsonEncode(<dynamic, dynamic>{
        'skillLevel': profile.skillLevel,
        'headline': profile.profileHeadline,
        'bio': profile.profileOverview,
        'tutorExpertise': profile.tutorExpertise,
        'hourlyRate': profile.hourlyRate,
        'subjects': profile.tutoredSubjects,
        'languages': profile.languages,
        'languageProficiency': profile.languageProficiency,
        'city': profile.tutorCity,
        'province': profile.tutorProvinceState
      }),
    );
    if (resp.statusCode == 200) {
      success = true;
      var registrationInfo = jsonDecode(resp.body);
      prefs.setString("tutorId", registrationInfo["tutorInfo"]["_id"]);
    }
    return success;
  }

  Future<dynamic> getTutorProfiles() async {
    http.Response tutorProfilesResp = await http.get("$baseUrl/all");
    if (tutorProfilesResp.statusCode == 200) {
      var allPosts = jsonDecode(tutorProfilesResp.body);
      return allPosts;
    }
    return null;
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
    if (remPostResp.statusCode == 200) {
      success = true;
    }
    return success;
  }

  //get incoming session requests for tutor
  Future<dynamic> getAllSessionRequests() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");
    String tutorId = sharedPrefs.getString("tutorId");

    http.Response getSessionsReq = await http.get(
      "$baseUrl/sessions/requests/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    if (getSessionsReq.statusCode == 200) {
      var allCurrentSessions = jsonDecode(getSessionsReq.body);
      return allCurrentSessions;
    }

    return null;
  }

  //create Session Request
  Future<bool> createSessionRequest({date, duration, subject, details, totalCost, tutorId}) async {
    /*api/tutors/request/:tutee_id/:tutor_id*/
    bool success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tuteeId = prefs.getString("tuteeId");
    String token = prefs.getString("token");
    http.Response createSessionsReq = await http.post(
      "$baseUrl/request/$tuteeId/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
      body: jsonEncode(<String, String>{
        'subject': subject,
        'date': date.toString(),
        'duration': duration,
        'details': details,
        'cost': totalCost.toString()
      }),
    );
    if (createSessionsReq.statusCode == 200) {
      success = true;
    }
    return success;
  }

  Future<bool> acceptSessionRequest({@required String tutorId, @required String requestId}) async {
    bool success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tuteeId = prefs.getString("tuteeId");
    String token = prefs.getString("token");
    http.Response acceptSessionsReq = await http.post(
      "$baseUrl/request/accept/$requestId/$tutorId/$tuteeId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );
    print(acceptSessionsReq.statusCode);
    if (acceptSessionsReq.statusCode == 200) {
      success = true;
    }
    return success;
  }
}
