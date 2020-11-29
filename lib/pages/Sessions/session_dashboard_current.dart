import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/current_sessions.dart';

class SessionDashboardCurrent extends StatefulWidget {
  @override
  _SessionDashboardCurrentState createState() => _SessionDashboardCurrentState();
}

class _SessionDashboardCurrentState extends State<SessionDashboardCurrent> {
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
        Expanded(child: CurrentSession()),
      ],
    );
  }
}
