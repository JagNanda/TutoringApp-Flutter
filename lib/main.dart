import 'package:flutter/material.dart';

import 'package:tutoring_app_flutter/pages/portal_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(TutoringApp());
}

class TutoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: {
        '/portal': (context) => PortalPage(),
      },
    );
  }
}
