import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/Sessions/sessions_home.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/postings_tab/student_dashboard_postings.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/tutors_tab/student_dashboard_tutors_home.dart';

class StudentDashboard extends StatefulWidget {
  final TutorProfile tutorProfile;
  StudentDashboard({this.tutorProfile});
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    StudentDashboardTutorsHome(),
    //TODO(jag): Replace with messaging once done
    SessionsHome(),
    SessionsHome(),
    StudentDashboardPostings()
  ];

  changeTabs(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeTabs,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Tutors"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Sessions"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Postings"),
        ],
      ),
    );
  }
}
