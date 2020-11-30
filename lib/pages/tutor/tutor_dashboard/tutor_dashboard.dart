import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
import 'jobs_tab/tutor_dashboard_jobs_favourites.dart';
import 'jobs_tab//tutor_dashboard_jobs_my_students.dart';
import 'jobs_tab//tutor_dashboard_jobs_search_page.dart';
import 'jobs_tab/tutor_dashboard_jobs_home.dart';

class TutorDashboard extends StatefulWidget {
  @override
  _TutorDashboardState createState() => _TutorDashboardState();
}

class _TutorDashboardState extends State<TutorDashboard> {
  int selectedIndex = 0;
  BottomNavigationBar _bottomNavigationBar;
  List<Widget> _widgetOptions;
  String tutorId;

  Future<Null> getTutorId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tutorId = prefs.getString("tutorId");
  }

  @override
  void initState() {
    super.initState();
    getTutorId();
    _widgetOptions = <Widget>[
      TutorDashboardJobsHome(),
      MainTutorProfile(id: tutorId),
      //TODO: Replace with sessions once done
      //TODO: Replace with chat once done
      //TODO: Replace with profile once done
    ];
    _bottomNavigationBar = BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: changeTabs,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "Tutors"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Sessions"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }

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
        body: _widgetOptions[selectedIndex],
        bottomNavigationBar: _bottomNavigationBar,
      ),
    );
  }
}
