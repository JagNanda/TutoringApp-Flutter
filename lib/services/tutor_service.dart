import 'dart:convert';

import 'package:http/http.dart' as http;

class TutorService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutors";

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
      print(allPosts.runtimeType);
      return allPosts;
    }
    return tutorProfilesResp.statusCode;
  }
}
