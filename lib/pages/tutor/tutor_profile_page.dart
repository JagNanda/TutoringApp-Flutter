// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tutoring_app_flutter/models/StarRatingDisplay.dart';
//
// class TutorProfilePage extends StatefulWidget {
//   static String tag = 'login-page';
//   @override
//   _TutorProfilePage createState() => _TutorProfilePage();
// }
//
// class _TutorProfilePage extends State<TutorProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 70.0,
//         child: Image.asset('assets/logo.png',),
//       ),
//     );
//
//     final intro = Card(
//       child: ListTile(
//         title: Text('<Insert Tutor_Name>'),
//         subtitle: Text(
//           '<insert tutor_headline> blah, blah, blah, blah',
//           textAlign: TextAlign.center,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//
//     final starRating = Card(
//         child: ListTile(
//             title: Center(
//               child: StarDisplay(
//                 value: 3,
//               ),
//             ),
//         )
//     );
//
//
//     final bio = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text('This space can be used to contain the '
//             'biography portion of the tutor\'s profile '
//             'page. \n\n This will allow students to learn '
//             'a little more about the instructor.'
//         ),
//       ],
//     );
//
//     final skills = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text('Skills:'),
//         Text('<Skill1>'),
//         Text('<Skill2>'),
//         Text('<Skill3>'),
//       ],
//     );
//
//     final accreditation = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text('Skills:'),
//         Text('<Degree Info>'),
//         Text('<Certifications>'),
//         Text('<Other accreditation List>: <skill1>, <skill2>...'),
//       ],
//     );
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 15.0),
//             logo,
//           ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.only(left:24.0, right: 24.0),
//             children: <Widget>[
//               SizedBox(height: 50.0),
//               intro,
//               SizedBox(height: 15.0),
//               starRating,
//               SizedBox(height: 15.0),
//               bio,
//               SizedBox(height: 15.0),
//               skills,
//               SizedBox(height: 15.0),
//               accreditation,
//               SizedBox(height: 24.0),
//             ],
//           ),
//         ]),
//       ),
//     );
//
//
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // Reference Code //
//
// /*
// * final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () {
//
//         },
//         padding: EdgeInsets.all(12),
//         color: Colors.green,
//         child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 17.0)),
//       ),
//     );
// *
// *
// *
//
//     final forgotLabel = FlatButton(
//       child: Text(
//         'Some Link',
//         style: TextStyle(color: Colors.purple, fontSize: 15),
//       ),
//       onPressed: (){
//       },
//     );
// *
// * */
