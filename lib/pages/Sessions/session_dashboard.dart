import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_completed.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_current.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_pending.dart';
import '../tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_favourites.dart';
import '../tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_my_students.dart';
import '../tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_search_page.dart';
import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionDashboard extends StatefulWidget {
  @override
  _SessionDashboard createState() => _SessionDashboard();
}

class _SessionDashboard extends State<SessionDashboard> {
  int selectedIndex = 1;

  getAppBar(int index) {
    if (index == 0) {
      return AppBar(
        title: Text("Dashboard"),
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.people)),
          Tab(icon: Icon(Icons.star))
        ]),
      );
    } else if (index == 1) {
      return AppBar(
        title: Text("Dashboard"),
        bottom: TabBar(tabs: [
          Text('Current', style: TextStyle(fontSize: 20, height: .7)),
          Text('Pending', style: TextStyle(fontSize: 20, height: .7)),
          Text('Completed', style: TextStyle(fontSize: 20, height: .7))
        ]),
      );
    }
  }

  getBarContent(int index) {
    if (index == 0) {
      return TabBarView(
        children: [
          TutorDashboardJobsSearchPage(),
          TutorDashboardJobsMyStudents(),
          TutorDashboardJobFavourites()
        ],
      );
    } else if (index == 1) {
      return TabBarView(
        children: [
          SessionDashboardCurrent(),
          SessionDashboardPending(),
          SessionDashboardCompleted()
        ],
      );
    }
  }

  changeTabs(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: new DrawerCodeOnly(),
        appBar: getAppBar(selectedIndex),
        body: getBarContent(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          //onTap: onTappedBar,
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
