import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/route_generator.dart';

//import 'package:tutoring_app_flutter/pages/registration_page.dart';

import 'package:tutoring_app_flutter/pages/messaging/messaging_page.dart';

/*
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/create_tutor_1_level_page.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/create_tutor_3_experience_page.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/create_tutor_4_education_page.dart';
import 'pages/login_page.dart';
import 'pages/tutor/tutor_profile_page.dart';
import 'pages/messaging/messaging_page.dart';
*/

void main() {
  runApp(TutoringApp());
}

class TutoringApp extends StatelessWidget {
  //final routes = <String, WidgetBuilder>{ //LoginPage.tag: (context) => LoginPage(), RegistrationPage.tag: (context) => RegistrationPage(), TutorProfilePage.tag: (context) => TutorProfilePage(),};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: MessagingPage(),

      //NOTE: Comment out the two below lines and un-comment 'home:' line above to test page
      //initialRoute: '/create_tutor_skill',
      //onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

/*
home: LoginPage(),
home: RegistrationPage(),
home: CreateTutor1LevelPage()
home: CreateTutor3ExperiencePage(),
home: CreateTutor4EducationPage(),
home: TutorProfilePage(),

 */