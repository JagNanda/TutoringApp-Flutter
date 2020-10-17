import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor2SubjectsPage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor2SubjectsPage({
    Key key,
    @required this.tutorProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add question:",
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
                        "Add Subjects", // TODO: Add text inputs (and create Chips) for subjects
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        //tutorProfile.tutoredSubjects.add("testSubject");
                        Navigator.of(context).pushNamed('/create_tutor_experience', arguments: tutorProfile);
                        print("Elementary Pressed");
                      }, // TODO: onPressed add subjects to delegate and segue to new page
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
                  Navigator.of(context).pushNamed('/create_tutor_skill', arguments: tutorProfile);
                  print("Back Pressed");
                  }, // TODO: onPressed segue to previous page
              ),
              padding: EdgeInsets.all(20),
            ),
          )
        ],
      ),
    );
  }
}
