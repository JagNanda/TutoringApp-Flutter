import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionDetails extends StatefulWidget {
  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}
final String name = "Brian Holmes";
final String date = "November 10, 2020";
final String cost ="60";
final String subject = "Flutter";
final String details = "Want to learn how to develop in flutter";
final String education = "University";


class _SessionDetailsState extends State<SessionDetails> {
  @override
  Widget build(BuildContext context){
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
                    "Session with " + name,
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
                      "Date: " + date,
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
                  "Cost: \$" + cost,
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
                    "Subject: " + subject,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                )
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
                    "Details",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ),
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
                  details,
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
                child:Center(
                  child: Text(
                    "Level of Education: " + education,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ]
      ),
    );
  }
}