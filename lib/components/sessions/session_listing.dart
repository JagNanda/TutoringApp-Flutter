import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_details.dart';

class SessionListing extends StatefulWidget {
  //TODO: make constructor params required after db is connected
  final String title;
  final String date;
  final String name;

  SessionListing({this.title, this.date, this.name});

  @override
  _SessionListingState createState() => _SessionListingState();
}

class _SessionListingState extends State<SessionListing> {
  @override
  void initState() {
    super.initState();
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
                          'BH',
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
                    "Upcoming Session with " + "Brian Holmes",
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
                Text("November 10, 2020",
                    textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold)),
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
        //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionRequest()));
      },
    );
  }
}
