import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class PortalPage extends StatefulWidget {

  //final TutorProfile tutorProfile = new TutorProfile(tutorId: "1");

  @override
  _PortalPageState createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  @override

  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Would you like to learn, or would you like to teach?:",
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
                                "I'm here to learn!",
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              Text(
                                "Click here to find your tutor!",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ]
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          if(tutorProfile.tutoredSubjects!=null)
                            {
                              for(int i = 0; i<tutorProfile.tutoredSubjects.length; i++)
                              {
                                print(tutorProfile.tutoredSubjects.elementAt(i).toString());
                              }
                            }
                          print("'Here to Learn' Pressed");
                          //Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
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
                                "I'm here to teach!",
                                style: TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              Text(
                                "Click here to connect with students!",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ]
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          tutorProfile = tutorProfile ?? new TutorProfile(tutorId: "Brian", languages: [], languageProficiency: []);// TODO : Update default constructor
                          Navigator.of(context).pushNamed('/create_tutor_skill', arguments: tutorProfile);
                          print("'Here to Teach' Pressed");
                          //Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
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
