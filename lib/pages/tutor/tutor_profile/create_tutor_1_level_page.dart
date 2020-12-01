import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';

class CreateTutor1LevelPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor1LevelPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor1LevelPageState createState() => _CreateTutor1LevelPageState();
}

class _CreateTutor1LevelPageState extends State<CreateTutor1LevelPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Hello, Please select the highest level you are capable of tutoring:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(20),
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
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Elementary",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                           widget.profile.skillLevel = "Elementary";
                          });
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateTutor2SubjectsPage(profile: widget.profile)));
                          print("Elementary Pressed");
                        },
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "High School",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                            widget.profile.skillLevel = "High School";
                          });
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateTutor2SubjectsPage(profile: widget.profile)));
                          print("High School Pressed");
                        },
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "College / University",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                            widget.profile.skillLevel = "College / University";
                          });
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateTutor2SubjectsPage(profile: widget.profile)));
                          print("College / University Pressed");
                        },
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
