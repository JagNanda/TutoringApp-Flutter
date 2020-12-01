import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/tutors_tab/student_dashboard_tutors_favorites.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/tutors_tab/student_dashboard_tutors_search.dart';

class StudentDashboardTutorsHome extends StatefulWidget {
  @override
  _StudentDashboardTutorsHomeState createState() => _StudentDashboardTutorsHomeState();
}

class _StudentDashboardTutorsHomeState extends State<StudentDashboardTutorsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Student Dashboard"),
          bottom: TabBar(tabs: [
            Tab(
              child: Column(
                children: [Icon(Icons.search), Text("Search")],
              ),
            ),
            Tab(
              child: Column(
                children: [Icon(Icons.star), Text("Favorites")],
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            StudentDashBoardTutorsSearch(),
            StudentDashboardTutorsFavorites(),
          ],
        ),
      ),
    );
  }
}
