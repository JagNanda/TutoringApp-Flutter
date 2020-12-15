import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_favourites.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_my_students.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/jobs_tab/tutor_dashboard_jobs_search_page.dart';

class TutorDashboardJobsHome extends StatefulWidget {
  @override
  _TutorDashboardJobsHomeState createState() => _TutorDashboardJobsHomeState();
}

class _TutorDashboardJobsHomeState extends State<TutorDashboardJobsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Tutor Dashboard"),
          bottom: TabBar(tabs: [Tab(icon: Icon(Icons.search)), Tab(icon: Icon(Icons.star))]),
        ),
        body: TabBarView(
          children: [
            TutorDashboardJobsSearchPage(),
            TutorDashboardJobFavourites(),
          ],
        ),
      ),
    );
  }
}
