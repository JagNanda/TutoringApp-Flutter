import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/completed_sessions.dart';

class SessionDashboardAccepted extends StatefulWidget {
  @override
  _SessionDashboardAcceptedState createState() => _SessionDashboardAcceptedState();
}

class _SessionDashboardAcceptedState extends State<SessionDashboardAccepted> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CompletedSession()),
      ],
    );
  }
}
