import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'pages/tutor/tutor_profile/all_create_tutor_pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    // getting arguments passed in while calling Navigator.pushNamed
    final profileReceived = settings.arguments;

    switch(settings.name){
      case '/create_tutor_skill':
        return MaterialPageRoute(builder: (_)=> CreateTutor1LevelPage());

      case '/create_tutor_subjects':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
              builder: (_)=> CreateTutor2SubjectsPage(
                tutorProfile: profileReceived,
              ),
          );
        }
        return _errorRoute();

      case '/create_tutor_experience':
        //return MaterialPageRoute(builder: (_)=> CreateTutor3ExperiencePage());
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor3ExperiencePage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_education':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor4EducationPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_languages':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor5LanguagesPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_hourly':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor6HourlyPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_overview':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor7OverviewPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_photo':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor8PhotoPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_location':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor9LocationPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_phone':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor10PhonePage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      case '/create_tutor_summary':
        if(profileReceived is TutorProfile){
          return MaterialPageRoute(
            builder: (_)=> CreateTutor11SummaryPage(
              tutorProfile: profileReceived,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();

    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
        title: Text('Error'),
        )
      );
    });
  }




}