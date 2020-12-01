/*
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';
import 'file:///C:/Users/Jag/AndroidStudioProjects/TutoringApp-Flutter/lib/pages/session_details.dart';

class PendingSession extends StatefulWidget {
  //TODO: make constructor params required after db is connected
  final String title;
  final String date;
  final String name;
  final String profilePicture;

  PendingSession({this.title, this.date, this.name, this.profilePicture});

  @override
  _PendingSessionState createState() => _PendingSessionState();
}

class _PendingSessionState extends State<PendingSession> {
  String name;
  @override
  void initState() {
    super.initState();

    //remove name once db in implemented
    name = "Brandon";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  child: new CircleAvatar(
                      radius: 35,
                      backgroundImage: new NetworkImage(
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png")),
                ),
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: new Text(
                    "Pending Session with " + name,
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
                //SizedBox(width: 40),
                Text("October 13, 2020",
                    textAlign: TextAlign.right, style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionDetails()));
      },
    );
  }
}
*/
