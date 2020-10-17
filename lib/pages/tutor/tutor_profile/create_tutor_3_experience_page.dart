import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';



class CreateTutor3ExperiencePage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor3ExperiencePage({
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
                        child: Column(
                            children: [
                              Text(
                                "Entry Level",
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              Text(
                                "(I'm new to this)",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ]
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          print("Entry Level Pressed");
                          Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
                          }, // TODO: onPressed add tutorExpertise to delegate and segue to new page
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Column(
                            children: [
                              Text(
                                "Intermediate",
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              Text(
                                "(I have substantial experience tutoring at this level)",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ]
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
                          print("Intermediate Pressed");
                          }, // TODO: onPressed add tutorExpertise to delegate and segue to new page
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Column(
                            children: [
                              Text(
                                "Expert",
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              Text(
                                "(I have extensive experience in tutoring students at this level)",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ]
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
                          print("Expert Pressed");
                          }, // TODO: onPressed add tutorExpertise to delegate and segue to new page
                      ),
                      width: double.maxFinite,
                    ),
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
                onPressed: (){
                  Navigator.of(context).pushNamed('/create_tutor_subjects', arguments: tutorProfile);
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
