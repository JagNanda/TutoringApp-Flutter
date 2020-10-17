import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor1LevelPage extends StatelessWidget {

  static TutorProfile tutorProfile = new TutorProfile(tutorId: "1");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Select the highest level you are capable of tutoring:",
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
                          child: Text(
                            "Elementary",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          onPressed: (){
                            tutorProfile.skillLevel = "Elementary";
                            Navigator.of(context).pushNamed('/create_tutor_subjects', arguments: tutorProfile);
                            print("Elementary Pressed");
                            }, // TODO: onPressed add skillLevel to delegate and segue to new page
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
                          onPressed: (){
                            tutorProfile.skillLevel = "High School";
                            Navigator.of(context).pushNamed('/create_tutor_subjects', arguments: tutorProfile);
                            print("High School Pressed");
                            }, // TODO: onPressed add skillLevel to delegate and segue to new page
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
                          onPressed: (){
                            tutorProfile.skillLevel = "College / University";
                            Navigator.of(context).pushNamed('/create_tutor_subjects', arguments: tutorProfile);
                            print("College / University Pressed");
                            }, // TODO: onPressed add skillLevel to delegate and segue to new page
                        ),
                        width: double.maxFinite,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            "Professional",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          onPressed: (){
                            tutorProfile.skillLevel = "Professional";
                            Navigator.of(context).pushNamed('/create_tutor_subjects', arguments: tutorProfile);
                            print("Professional Pressed");
                            }, // TODO: onPressed add skillLevel to delegate and segue to new page
                        ),
                        width: double.maxFinite,
                      )
                    ],
                  ),
                ),
              ),
            ),
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
                onPressed: (){print("Back Pressed");}, // TODO: onPressed segue to previous page
              ),
              padding: EdgeInsets.all(20),
            ),
          )
        ],
      ),
    );
  }
}
