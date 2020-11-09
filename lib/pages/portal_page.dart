import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';

import 'student/student_dashboard/student_dashboard.dart';

class PortalPage extends StatelessWidget {
  final TutorProfile tutorProfile;
  PortalPage(this.tutorProfile);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: Text("I WANT TO LEARN", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentDashboard()),
                );
              },
            ),
            SizedBox(height: 20),
            Text("--- OR ---", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
            SizedBox(height: 20),
            OutlineButton(
              borderSide: BorderSide(color: Colors.blue),
              child: Text("I WANT TO TEACH", style: TextStyle(color: Colors.blue)),
              focusColor: Colors.blue,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainTutorProfile(tutorProfile)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
