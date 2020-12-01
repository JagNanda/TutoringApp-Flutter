// import 'package:flutter/material.dart';
//
// import 'all_create_tutor_pages.dart';
//
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Create a Tutor Profile')),
//         ),
//         body: ListView(children: [
//           SizedBox(
//             width: 250,
//             height: 250,
//             child: Stack(
//               children: [
//                 Container(
//                   width: 250,
//                   height: 250,
//                   color: Colors.white,
//                 ),
//                 Container(
//                   child: Center(
//                     child: CircleAvatar(
//                       radius: 90,
//                       child: Text(
//                         'BH',
//                         style: TextStyle(color: Colors.white, fontSize: 80.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(5.0),
//                   alignment: Alignment.bottomCenter,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
//                     ),
//                   ),
//                   child: Text(
//                     tutorProfile.tutorId,
//                     style: TextStyle(color: Colors.white, fontSize: 20.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 250,
//             height: 50,
//             child: Row(
//               children: [
//                 SizedBox(width: 10),
//                 RaisedButton(
//                     child: Text(
//                       "Send Message",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     onPressed: null),
//                 SizedBox(width: 70),
//                 RaisedButton(
//                     child: Text(
//                       "Request Session",
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     color: Colors.green,
//                     onPressed: () {
//                       Navigator.push(context,
//                           new MaterialPageRoute(builder: (context) => new SessionRequest()));
//                     }),
//               ],
//             ),
//           ),
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Text(tutorProfile.tutorId),
//                 subtitle: Text(
//                     tutorProfile.tutorCity + ', ' + tutorProfile.tutorCountry),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor9LocationPage()));
//
//               setState(() {
//
//               });
//             },
//           ), // Location Input
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(child: Text(tutorProfile.profileHeadline)),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor11SummaryPage(
//                           tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Profile Headline Input
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(child: Text(tutorProfile.profileOverview)),
//                 contentPadding: const EdgeInsets.all(10),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor7OverviewPage(
//                           tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Profile Message Input
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(child: Text(tutorProfile.skillLevel + ' level tutor')),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           CreateTutor1LevelPage(tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Tutoring Skill Level Input
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Text('Tutored Subjects: '),
//                 subtitle: Column(children: [
//                   for (var i in tutorProfile.tutoredSubjects) Text(i),
//                 ]),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor2SubjectsPage(
//                           tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Tutored Subjects Input
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(
//                   child: Text('Subject expertise: ' +
//                       tutorProfile.tutorExpertise +
//                       ' level'),
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor3ExperiencePage(
//                           tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Tutoring Experience
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Text('Languages: '),
//                 subtitle: Row(
//                   children: [
//                     SizedBox(width: 100),
//                     Column(children: [
//                       for (var i in tutorProfile.languages) Text(i),
//                     ]),
//                     SizedBox(width: 20),
//                     Column(children: [
//                       for (var i in tutorProfile.languages) Text(' - '),
//                     ]),
//                     SizedBox(width: 20),
//                     Column(children: [
//                       for (var i in tutorProfile.languageProficiency) Text(i),
//                     ]),
//                   ],
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CreateTutor5LanguagesPage(
//                           tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Languages
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(
//                   child: Text('Hourly rate: \$' +
//                       tutorProfile.hourlyRate.toString() +
//                       '/hr'),
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           CreateTutor6HourlyPage(tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ), // Hourly Rate Input
//           SizedBox(height: 20),
//           GestureDetector(
//
//             child: Column(
//               children: [
//                 Text('For Internal use Only: '),
//                 SizedBox(width: 10),
//                 Text(tutorProfile.tutorStreetAdd),
//                 Text(tutorProfile.tutorCity),
//                 Text(tutorProfile.tutorProvinceState),
//                 Text(tutorProfile.tutorPostal),
//                 Text(tutorProfile.tutorCountry),
//                 Text(tutorProfile.phone)
//               ],
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           CreateTutor10PhonePage(tutorProfile: tutorProfile)));
//               setState(() {
//
//               });
//             },
//           ),
//           SizedBox(
//             width: 250,
//             height: 50,
//             child: RaisedButton(
//                 child: Text(
//                   "Edit Profile",
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 onPressed: null),
//           ),
//         ]),
//       ),
//     );
//   }
// }
