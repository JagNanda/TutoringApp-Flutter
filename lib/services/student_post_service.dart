import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoring_app_flutter/models/student_post.dart';
import 'package:http/http.dart' as http;

class StudentPostService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutees/post";

  //create a student post
  Future<bool> createPost(StudentPost post) async {
    bool success = false;

    //get token
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");

    //get tutee id
    String tuteeId = sharedPrefs.getString("tuteeId");

    http.Response createPostResp = await http.post(
      "$baseUrl/$tuteeId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
      body: jsonEncode(<String, String>{
        'title': post.title,
        'subject': post.subject,
        'budgetRange': post.budgetRange,
        'levelOfEducation': post.levelOfEducation,
        'description': post.description
      }),
    );

    if (createPostResp.statusCode == 200) {
      success = true;
    }

    return success;
  }

  Future<dynamic> getAllPostsByUserId() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String tuteeId = sharedPrefs.getString("tuteeId");
    http.Response tuteeIdResp = await http.get(
      "$baseUrl/$tuteeId",
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (tuteeIdResp.statusCode == 200) {
      var tuteeInfo = jsonDecode(tuteeIdResp.body);
      List<dynamic> allPosts = tuteeInfo["posts"];
      return allPosts;
    }
    return tuteeIdResp.statusCode;
  }

  Future<dynamic> getAllPosts() async {
    http.Response allPostsResp = await http.get("$baseUrl/all");
    if (allPostsResp.statusCode == 200) {
      var allPosts = jsonDecode(allPostsResp.body);
      return allPosts;
    }
    return allPostsResp.statusCode;
  }

  Future<dynamic> getAllPostsBySubject(String subject) async {
    http.Response allPostsResp = await http.get("$baseUrl/all/$subject");
    if (allPostsResp.statusCode == 200) {
      var allPosts = jsonDecode(allPostsResp.body);
      return allPosts;
    }
    return allPostsResp.statusCode;
  }
}
