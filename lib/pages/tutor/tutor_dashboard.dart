import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard_favourites.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard_my_students.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard_search_page.dart';

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
            TutorDashboardSearchPage(),
            TutorDashboardMyStudents(),
            TutorDashboardFavourites()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: changeTabs,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.work), title: Text("Jobs")),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Sessions")),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Chat")),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Chat")),
          ],
        ),
      ),
    );
  }
}
