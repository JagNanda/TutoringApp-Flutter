import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/session_listing.dart';
import 'package:tutoring_app_flutter/services/student_service.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class SessionAcceptedRequests extends StatefulWidget {
  final bool isStudent;

  SessionAcceptedRequests({@required this.isStudent});
  @override
  _SessionAcceptedRequestsState createState() => _SessionAcceptedRequestsState();
}

class _SessionAcceptedRequestsState extends State<SessionAcceptedRequests> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<SessionListing>> loadStudentRequests() async {
    List<dynamic> allSessionInfo = await StudentService().getAllSessionRequests();

    List<SessionListing> allSessionListings = new List<SessionListing>();
    allSessionInfo.forEach((session) {
      print(session);
      if (session["accepted"] == true) {
        allSessionListings.add(SessionListing(
          details: session["details"],
          firstName: session["userInfo"]["firstName"],
          lastName: session["userInfo"]["lastName"],
          levelOfEducation: session["levelOfEducation"],
          subject: session["subject"],
          date: session["date"],
          isStudent: true,
        ));
      }
    });

    return allSessionListings;
  }

  Future<List<SessionListing>> loadTutorsIncomingRequests() async {
    List<dynamic> allSessionInfo = await TutorService().getAllSessionRequests();

    List<SessionListing> allSessionListings = new List<SessionListing>();
    allSessionInfo.forEach((session) {
      if (session["accepted"] == true) {
        allSessionListings.add(SessionListing(
          requestId: session["_id"],
          tutorId: session["tutorId"],
          details: session["details"],
          firstName: session["userInfo"]["firstName"],
          lastName: session["userInfo"]["lastName"],
          levelOfEducation: session["levelOfEducation"],
          subject: session["subject"],
          date: session["date"],
          isStudent: true,
        ));
      }
    });
    return allSessionListings;
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
                      "You do not have any requests",
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
