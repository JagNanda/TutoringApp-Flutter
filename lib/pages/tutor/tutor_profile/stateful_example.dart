/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor5LanguagesPage extends StatefulWidget {
  final TutorProfile tutorProfile;

  const CreateTutor5LanguagesPage({
    Key key,
    @required this.tutorProfile,
  }) : super(key: key);

  @override
  _CreateTutor5LanguagesPageState createState() => _CreateTutor5LanguagesPageState();
}

class _CreateTutor5LanguagesPageState extends State<CreateTutor5LanguagesPage> {

  TutorProfile tutorProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add Languages:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(30),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Step forward",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        //tutorProfile.languages.add("English");
                        //tutorProfile.languages.add("Fluent");
                        Navigator.of(context).pushNamed('/create_tutor_hourly', arguments: tutorProfile);
                        print("Step forward Pressed");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          //MARK: Back Button
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                color: Colors.grey,
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(20),
                onPressed: (){
                  Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
                  print("Back Pressed");
                },
              ),
              padding: EdgeInsets.all(20),
            ),
          )
        ],
      ),
    );
  }
}
*/