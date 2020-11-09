import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor4EducationPage extends StatefulWidget {
  final TutorProfile tutorProfile;

  const CreateTutor4EducationPage({
    Key key,
    @required this.tutorProfile,
  }) : super(key: key);

  @override
  _CreateTutor4EducationPageState createState() => _CreateTutor4EducationPageState();
}

class _CreateTutor4EducationPageState extends State<CreateTutor4EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add education:",
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
                    Text("Name of school:"),
                    TextFormField(

                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.deepPurple,
                      child: Text(
                        "Test",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        print(">>>> Languages:");
                        for(int i=0; i < tutorProfile.languages.length; i++)
                        {
                          print(tutorProfile.languages[i]);
                          print("    " + tutorProfile.languageProficiency[i]);
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Column(
                          children: [
                            Text(
                              "next",
                              style: TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ]
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/create_tutor_languages', arguments: widget.tutorProfile);
                        print("step forward pressed");
                      }, // TODO: onPressed add tutorEducation to delegate and segue to new page
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
                  Navigator.of(context).pushNamed('/create_tutor_experience', arguments: widget.tutorProfile);
                  print("Back Pressed");
                  }, // TODO: onPressed segue to previous page
              ),
              padding: EdgeInsets.all(20),
            ),
          ),

        ],
      ),
    );
  }
}
