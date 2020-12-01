import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/session_listing.dart';
import 'package:tutoring_app_flutter/services/student_service.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class SessionOutgoingRequests extends StatefulWidget {
  final bool isStudent;

  SessionOutgoingRequests({@required this.isStudent});
  @override
  _SessionOutgoingRequestsState createState() => _SessionOutgoingRequestsState();
}

class _SessionOutgoingRequestsState extends State<SessionOutgoingRequests> {
  @override
  void initState() {
    print(widget.isStudent);
    super.initState();
  }

  Future<List<SessionListing>> loadStudentRequests() async {
    List<dynamic> allSessions = await StudentService().getAllSessionRequests();
    return allSessions.map((session) {
      return SessionListing(
        details: session["details"],
        firstName: session["userInfo"]["firstName"],
        lastName: session["userInfo"]["lastName"],
        levelOfEducation: session["levelOfEducation"],
        subject: session["subject"],
        date: session["date"],
      );
    }).toList();
  }

  Future<List<SessionListing>> loadTutorsIncomingRequests() async {
    List<dynamic> allSessions = await TutorService().getAllSessionRequests();
    return allSessions.map((session) {
      return SessionListing(
        details: session["details"],
        firstName: session["userInfo"]["firstName"],
        lastName: session["userInfo"]["lastName"],
        levelOfEducation: session["levelOfEducation"],
        subject: session["subject"],
        date: session["date"],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.isStudent ? loadStudentRequests() : loadTutorsIncomingRequests(),
      builder: (BuildContext context, AsyncSnapshot<List<SessionListing>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(child: CircularProgressIndicator(), width: 70, height: 70);
        } else {
          return !snapshot.hasData
              ? Text("No Data")
              : snapshot.data.length == 0
                  ? Center(
                      child: Text(
                      "You do not have any current Sessions",
                      textAlign: TextAlign.center,
                    ))
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return snapshot.data[index];
                      },
                    );
        }
      },
    );
  }
}
