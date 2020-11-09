import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionDetails extends StatefulWidget {
  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}
final String name = "Brandon";
final String date = "November 1, 2020";
final String cost ="20";
final String subject = "Math";
final String details = "Getting tutored in Math";
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
              child: new CircleAvatar(
                  radius: 35,
                  backgroundImage: new NetworkImage("https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/09/among_us_google_play_icon.jpg")
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