import 'package:flutter/material.dart';
import 'jobs_tab/tutor_dashboard_jobs_favourites.dart';
import 'jobs_tab//tutor_dashboard_jobs_my_students.dart';
import 'jobs_tab//tutor_dashboard_jobs_search_page.dart';

class TutorDashboard extends StatefulWidget {
  @override
  _TutorDashboardState createState() => _TutorDashboardState();
}

class _TutorDashboardState extends State<TutorDashboard> {
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
            TutorDashboardJobsSearchPage(),
            TutorDashboardJobsMyStudents(),
            TutorDashboardJobFavourites()
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
