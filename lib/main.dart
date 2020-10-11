import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/tutor/TutorDashboard.dart';
import 'pages/login_page.dart';

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
      home: TutorDashboard(),
      routes: routes,
    );
  }
}
