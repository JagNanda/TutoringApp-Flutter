import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_details.dart';

class SessionListing extends StatefulWidget {
  //TODO: make constructor params required after db is connected

  final String firstName;
  final String lastName;
  final String subject;
  final String details;
  final String levelOfEducation;
  final String date;

  SessionListing(
      {this.firstName,
      this.lastName,
      this.subject,
      this.details,
      this.date,
      this.levelOfEducation});

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
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //TODO: Replace placeholder text with class variables
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
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                //SizedBox(width:),
                Text(formattedDateCreated,
                    textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionDetails()));
        //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionRequest()));
      },
    );
  }
}
