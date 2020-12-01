// import 'package:flutter/material.dart';
// import 'package:tutoring_app_flutter/models/tutor_profile.dart';
// import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
//
// import 'main_tutorProfile.dart';
//
// class TeachPortalButton extends StatelessWidget {
//   final TutorProfile tutorProfile = new TutorProfile(
//         tutorId: "Brian",
//         languages: ['English', 'Spanish'],
//         languageProficiency: ['Basic', 'Basic'],
//         isCompleted: true,
//       );
//
//   TeachPortalButton();
//
//
// // class TeachPortalButton extends StatefulWidget {
// //   final TutorProfile tutorProfile;
// //   TeachPortalButton(this.tutorProfile);
// //
// //   @override
// //   _TeachPortalButtonState createState() => _TeachPortalButtonState();
// // }
// //
// // class _TeachPortalButtonState extends State<TeachPortalButton> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: RaisedButton(
//         color: Colors.blue,
//         child: Column(children: [
//           Text(
//             "I'm here to teach!",
//             style: TextStyle(color: Colors.white, fontSize: 24),
//           ),
//           Text(
//             "Click here to connect with students!",
//             style: TextStyle(color: Colors.white, fontSize: 12),
//           )
//         ]),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         padding: EdgeInsets.all(20),
//         onPressed: () {
//           //Navigator.of(context).pushNamed('/main_tutorProfile');
//           Navigator.push(context,
//               new MaterialPageRoute(builder: (context) => MainTutorProfile(tutorProfile)));
//         },
//       ),
//       width: double.maxFinite,
//     );
//   }
// }
//
// // onPressed: () {
// //   tutorProfile = tutorProfile ??
// //       new TutorProfile(
// //         tutorId: "Brian",
// //         languages: [],
// //         languageProficiency: [],
// //         isCompleted: true,
// //       );
// //   Navigator.of(context)
// //       .pushNamed('/main_tutorProfile', arguments: tutorProfile);
// //   print("'Here to Teach' Pressed");
// //   //Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
// // },
//
// //
// // final TutorProfile tutorProfile = new TutorProfile(
// //   tutorId: "Brian",
// //   languages: [],
// //   languageProficiency: [],
// //   isCompleted: false,
// // );