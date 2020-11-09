import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_completed.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_current.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_pending.dart';

class SessionsHome extends StatefulWidget {
  @override
  _SessionsHomeState createState() => _SessionsHomeState();
}

class _SessionsHomeState extends State<SessionsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Student Dashboard"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.search)),
            Tab(icon: Icon(Icons.people)),
            Tab(icon: Icon(Icons.star))
          ]),
        ),
        body: TabBarView(
          children: [
            SessionDashboardCurrent(),
            SessionDashboardPending(),
            SessionDashboardCompleted()
          ],
        ),
      ),
    );
  }
}
