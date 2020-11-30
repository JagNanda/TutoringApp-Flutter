import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
import 'package:tutoring_app_flutter/services/user_service.dart';

import 'student/student_dashboard/student_dashboard.dart';

class PortalPage extends StatelessWidget {
  noProfileAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("You do not have a profile"),
            content: Text("Do you want to create a tutor profile?"),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Create Profile'),
                onPressed: () {
                  TutorProfile profile = new TutorProfile();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateTutor3ExperiencePage(profile: profile)));
                },
              )
            ],
          );
        });
  }

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
              onPressed: () async {
                bool isTutor = await UserService().hasTutorProfile();

                if (isTutor) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => TutorDashboard()));
                } else {
                  print("Sorry you're not a tutor");
                  //TutorProfile profile = new TutorProfile();
                  //TODO: will crash atm because we arent fetching the profile yet in maintutorprofile
                  noProfileAlertDialog(context);

                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => CreateTutor3ExperiencePage(profile: profile))); //TODO: CREATE PROFILE TREE
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:tutoring_app_flutter/main.dart';
// import 'package:tutoring_app_flutter/models/tutor_profile.dart';
// import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
// import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/createNew_tutorProfile.dart';
// import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
//
// import 'student/student_dashboard/student_dashboard.dart';
//
// class PortalPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             RaisedButton(
//               child: Text("I WANT TO LEARN", style: TextStyle(color: Colors.white)),
//               color: Colors.blue,
//               padding: EdgeInsets.all(20),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => StudentDashboard(tutorProfile)),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Text("--- OR ---", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
//             SizedBox(height: 20),
//             OutlineButton(
//               borderSide: BorderSide(color: Colors.blue),
//               child: Text("I WANT TO TEACH", style: TextStyle(color: Colors.blue)),
//               focusColor: Colors.blue,
//               padding: EdgeInsets.all(20),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               onPressed: () {
//                 //Navigator.push(context, MaterialPageRoute(builder: (context) => TutorDashboard()));
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewTutorProfile()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
