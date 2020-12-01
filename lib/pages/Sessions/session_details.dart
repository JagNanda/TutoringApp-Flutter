import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionDetails extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String date;
  final String cost;
  final String subject;
  final String details;
  final String education;

  SessionDetails(
      {this.firstName,
      this.lastName,
      this.date,
      this.cost,
      this.subject,
      this.details,
      this.education});

  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: new DrawerCodeOnly(), // line needed to have Drawer menu on each page, not needed as back button is more appropriate
      appBar: new AppBar(
        title: new Text("Session Details"),
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                height: 50.0,
                child: Center(
                  child: Text(
                    "Session with ${widget.firstName} ${widget.lastName}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                height: 50.0,
                child: Center(
                  child: Text(
                    "Date: ${widget.date}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                height: 50.0,
                child: Center(
                  child: Text(
                    "Cost: \$" + widget.cost,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  color: Colors.lightBlue,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Subject: " + widget.subject,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.only(bottom: 20),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.lightBlue,
                padding: EdgeInsets.only(bottom: 20),
                height: 50.0,
                child: Text(
                  widget.details,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.only(bottom: 20),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Level of Education: " + widget.education,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
