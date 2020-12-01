import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/completed_sessions.dart';

class SessionDashboardCompleted extends StatefulWidget {
  @override
  _SessionDashboardCompletedState createState() => _SessionDashboardCompletedState();
}

class _SessionDashboardCompletedState extends State<SessionDashboardCompleted> {
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
