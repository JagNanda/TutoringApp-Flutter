import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';

class CreateTutor1LevelPage extends StatefulWidget {


  const CreateTutor1LevelPage();

  @override
  _CreateTutor1LevelPageState createState() => _CreateTutor1LevelPageState();
}

class _CreateTutor1LevelPageState extends State<CreateTutor1LevelPage> {
  TutorProfile profile = new TutorProfile();

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
                          //widget.tutorProfile.skillLevel = "Elementary"; //TODO: remove
                          setState(() {
                            profile.skillLevel = "Elementary";
                          });
                          Navigator.pop(context);
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
                        onPressed: () {
                          //widget.tutorProfile.skillLevel = "High School";//TODO: remove
                          setState(() {
                            profile.skillLevel = "High School";
                          });
                          Navigator.pop(context);
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
                        onPressed: () {
                          //widget.tutorProfile.skillLevel = "College / University";//TODO: remove
                          setState(() {
                            profile.skillLevel = "College / University";
                          });
                          Navigator.pop(context);
                          print("College / University Pressed");
                        }, // TODO: onPressed add skillLevel to delegate and segue to new page
                      ),
                      width: double.maxFinite,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.bottomCenter,
          //     child: RaisedButton(
          //       color: Colors.grey,
          //       child: Text(
          //         "Back",
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //       padding: EdgeInsets.all(20),
          //       onPressed: (){
          //         //Navigator.of(context).pushNamed('/portal', arguments: widget.tutorProfile);
          //         Navigator.of(context).pop();
          //         print("Back Pressed");
          //         }, // TODO: onPressed segue to previous page
          //     ),
          //     padding: EdgeInsets.all(20),
          //   ),
          // )
        ],
      ),
    );
  }
}
