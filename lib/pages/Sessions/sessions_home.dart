import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_accepted_requests.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard_accepted.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_outgoing_requests.dart';

class SessionsHome extends StatefulWidget {
  final bool isStudent;

  SessionsHome({@required this.isStudent});
  @override
  _SessionsHomeState createState() => _SessionsHomeState();
}

class _SessionsHomeState extends State<SessionsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Sessions"),
          bottom: TabBar(tabs: [
            Tab(
              child: Column(
                children: [Icon(Icons.arrow_forward), Text("Requests")],
              ),
            ),
            Tab(
              child: Column(
                children: [Icon(Icons.check), Text("Accepted")],
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            SessionOutgoingRequests(isStudent: widget.isStudent),
            SessionAcceptedRequests(isStudent: widget.isStudent),
          ],
        ),
      ),
    );
  }
}
