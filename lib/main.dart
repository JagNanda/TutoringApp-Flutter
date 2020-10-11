import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard.dart';
import 'pages/login_page.dart';
import 'pages/messaging/messaging_page.dart';

void main() {
  runApp(TutoringApp());
}

class TutoringApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: MessagingPage(),
      routes: routes,
    );
  }
}
