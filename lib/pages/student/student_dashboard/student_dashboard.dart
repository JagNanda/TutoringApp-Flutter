import 'package:flutter/material.dart';

import 'tutors_tab/student_dashboard_favorites.dart';
import 'tutors_tab/student_dashboard_my_tutors.dart';
import 'tutors_tab/student_dashboard_search.dart';

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
            BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("Tutors")),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Sessions")),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Chat")),
            BottomNavigationBarItem(icon: Icon(Icons.note), title: Text("Postings")),
          ],
        ),
      ),
    );
  }
}
