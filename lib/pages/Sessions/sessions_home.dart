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
            Text('Current', style: TextStyle(fontSize: 20, height: .7)),
            Text('Pending', style: TextStyle(fontSize: 20, height: .7)),
            Text('Completed', style: TextStyle(fontSize: 20, height: .7))
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
