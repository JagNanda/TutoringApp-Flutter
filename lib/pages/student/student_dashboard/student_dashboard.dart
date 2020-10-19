import 'package:flutter/material.dart';

import 'tutors_tab/student_dashboard_tutors_favorites.dart';
import 'tutors_tab/student_dashboard_tutors_my_tutors.dart';
import 'tutors_tab/student_dashboard_tutors_search.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int selectedIndex = 0;

  changeTabs(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.people)),
            Tab(icon: Icon(Icons.star))
          ]),
        ),
        body: TabBarView(
          children: [
            StudentDashBoardSearch(),
            StudentDashboardMyTutors(),
            StudentDashboardFavorites()
          ],
        ),
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
      ),
    );
  }
}
