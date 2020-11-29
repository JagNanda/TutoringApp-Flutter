import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/current_sessions.dart';
import 'package:tutoring_app_flutter/components/sessions/session_request.dart';

import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard.dart';
import 'package:tutoring_app_flutter/pages/Sessions/sessions_home.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_home.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
import 'models/education_history.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/postings_tab/student_dashboard_postings_form.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'pages/login_page.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/student_dashboard.dart';
import 'package:tutoring_app_flutter/route_generator.dart';

import 'package:tutoring_app_flutter/pages/registration_page.dart';

import 'models/tutor_profile.dart';

/*
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
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
  // final routes = <String, WidgetBuilder>{
  //   LoginPage.tag: (context) =>
  //       LoginPage(tutorProfile), /*RegistrationPage.tag: (context) => RegistrationPage(), TutorProfilePage.tag: (context) => TutorProfilePage(),*/
  //};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),

      //NOTE: Comment out the two below lines and un-comment 'home:' line above to test page
      //initialRoute: '/portal',
      //: RouteGenerator.generateRoute,
    );
  }
}

/*EducationHistory educationHistory1 = new EducationHistory(
    schoolName: 'Sheridan College',
    schoolCity: 'Oakville',
    schoolCountry: 'Canada',
    schoolProgramName: 'Software Engineering',
    schoolStartMonth: 'September',
    schoolStartYear: '2017',
    schoolThroughMonth: 'May',
    schoolThroughYear: '2021',
    schoolDescription: 'blah, blah, blah....diploma');*/

/*TutorProfile tutorProfile = new TutorProfile(
  tutorId: "Brian Holmes",
  skillLevel: 'Elementary',
  tutoredSubjects: ['Flutter', 'Dart', 'Statistics'],
  tutorExpertise: 'Expert',
  education: [educationHistory1],
  languages: ['English', 'Spanish'],
  languageProficiency: ['Native', 'Basic'],
  hourlyRate: 25.0,
  profileHeadline: 'I will help you understand Flutter!',
  profileOverview: 'Hey there, I love math and I love '
      'helping people explore math in simply ways that '
      'are easy to understand and remember! Send me a '
      'message and see how I can help YOU become a math '
      'WHIZ!',
  profilePicImgUrl: null,
  tutorCountry: 'Canada',
  tutorStreetAdd: '3220 Colebrook Court',
  tutorCity: 'Mississauga',
  tutorProvinceState: 'Ontario',
  tutorPostal: 'L5N3E2',
  phone: "(416) 987-1234",
  isCompleted: true,
);*/
