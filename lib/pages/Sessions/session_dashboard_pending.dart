import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/pending_sessions.dart';

class SessionDashboardPending extends StatefulWidget {
  @override
  _SessionDashboardPendingState createState() => _SessionDashboardPendingState();
}

class _SessionDashboardPendingState extends State<SessionDashboardPending> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search your Sessions",
              icon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Expanded(child: PendingSession()),
      ],
    );
  }
}