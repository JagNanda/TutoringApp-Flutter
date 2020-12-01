import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_details.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class SessionListing extends StatefulWidget {
  final String tutorId;
  final String requestId;
  final String firstName;
  final String lastName;
  final String subject;
  final String details;
  final String levelOfEducation;
  final String date;
  final bool isStudent;
  SessionListing(
      {this.firstName,
      this.lastName,
      this.subject,
      this.details,
      this.date,
      this.tutorId,
      this.requestId,
      this.levelOfEducation,
      this.isStudent = false});

  @override
  _SessionListingState createState() => _SessionListingState();
}

class _SessionListingState extends State<SessionListing> {
  String initials;
  String formattedDateCreated;

  @override
  void initState() {
    super.initState();
    DateTime dateCreated = DateTime.parse(widget.date);
    formattedDateCreated =
        "${dateCreated.year}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}";
    initials = widget.firstName[0] + widget.lastName[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 35,
                      child: Text(
                        initials,
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: new Text(
                  "Upcoming Session with ${widget.firstName} ${widget.lastName}",
                  textAlign: TextAlign.center,
                  style: kPostTitleText,
                ),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          widget.isStudent
              ? Text(
                  formattedDateCreated,
                  textAlign: TextAlign.left,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      formattedDateCreated,
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RaisedButton(
                        color: Colors.green,
                        child: Text(
                          "Accept Session",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () async {
                          bool success = await TutorService().acceptSessionRequest(
                              tutorId: widget.tutorId, requestId: widget.requestId);
                          if (success) {
                            Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Session request accepted.")));
                          }
                        })
                  ],
                ),
        ],
      ),
    );
  }
}
