import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/session_request.dart';
import 'package:tutoring_app_flutter/constants.dart';
import 'package:tutoring_app_flutter/components/sessions/session_details.dart';
class CurrentSession extends StatefulWidget {
  //TODO: make constructor params required after db is connected
  final String title;
  final String date;
  final String name;
  final String profilePicture;


  CurrentSession({
    this.title,
    this.date,
    this.name,
    this.profilePicture
  });

  @override
  _CurrentSessionState createState() => _CurrentSessionState();
}

class _CurrentSessionState extends State<CurrentSession> {
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
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
               //TODO: Replace placeholder text with class variables
              children: [
              Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: new CircleAvatar(
                  radius: 35,
                  backgroundImage: new NetworkImage("https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/09/among_us_google_play_icon.jpg")
                ),
               ),
             SizedBox(
              width: 30,
             ),
                Flexible(
                  child: new Text(
                    "Upcoming Session with " + name,
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
                   Text(
                    "October 13, 2020",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                    fontWeight: FontWeight.bold
                  )
                 ),
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
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionDetails()));
        //Navigator.push(context, new MaterialPageRoute(builder: (context) => new SessionRequest()));
      },
    );
  }
}
