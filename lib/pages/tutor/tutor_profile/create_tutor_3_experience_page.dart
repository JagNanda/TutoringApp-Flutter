import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';

class CreateTutor3ExperiencePage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor3ExperiencePage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor3ExperiencePageState createState() =>
      _CreateTutor3ExperiencePageState();
}

class _CreateTutor3ExperiencePageState
    extends State<CreateTutor3ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "How much experience do you have tutoring at this level?:",
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
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Column(children: [
                          Text(
                            "Entry Level",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "(I'm new to this)",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                            widget.profile.tutorExpertise = "Entry Level";
                          });
                          print("Entry Level Pressed");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTutor1LevelPage(
                                      profile: widget.profile)));
                        },
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Column(children: [
                          Text(
                            "Intermediate",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "(I have substantial experience tutoring at this level)",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                            widget.profile.tutorExpertise = "Intermediate";
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTutor1LevelPage(
                                      profile: widget.profile)));
                          print("Intermediate Pressed");
                        },
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Column(children: [
                          Text(
                            "Expert",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "(I have extensive experience in tutoring students at this level)",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ]),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: () {
                          setState(() {
                            widget.profile.tutorExpertise = "Expert";
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTutor1LevelPage(
                                      profile: widget.profile)));
                          print("Expert Pressed");
                        },
                      ),
                      width: double.maxFinite,
                    ),
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
