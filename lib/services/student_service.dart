import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StudentService {
  final String baseUrl = "http://10.0.2.2:5000/api/tutees";

  Future<bool> addTutorToFavourites(String tutorId) async {
    bool success = false;
    //get token
    final sharedPrefs = await SharedPreferences.getInstance();
    String token = sharedPrefs.getString("token");

    //get tutee id
    String tuteeId = sharedPrefs.getString("tuteeId");
    http.Response addTutorResp = await http.put(
      "$baseUrl/$tuteeId/tutors/$tutorId",
      headers: <String, String>{'Content-Type': 'application/json', 'x-auth-token': '$token'},
    );

    if (addTutorResp.statusCode == 200) {
      success = true;
      print("favorited");
    }

    return success;
  }
}
