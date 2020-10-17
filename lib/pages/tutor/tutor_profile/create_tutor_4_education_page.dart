import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor4EducationPage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor4EducationPage({
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
                    RaisedButton(
                      color: Colors.blue,
                      child: Column(
                          children: [
                            Text(
                              "Step forward",
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
                        Navigator.of(context).pushNamed('/create_tutor_languages', arguments: tutorProfile);
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
                  Navigator.of(context).pushNamed('/create_tutor_experience', arguments: tutorProfile);
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
