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
//                     tutorProfile.tutorId, //TODO: Get name from userID
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
//                 title: Text(tutorProfile.tutorId), //TODO: Get name from userID
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
//               });
//             },
//           ), // Hourly Rate Input
//           SizedBox(height: 20),
//           GestureDetector(
//             // TODO: Only visible to tutorProfile owner
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
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
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
//                 onPressed: null), //TODO: Change color of button and text to -> "tap field to edit", and enable GestureDetectors
//           ),
//         ]),
//       ),
//     );
//   }
// }
