import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor7OverviewPage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor7OverviewPage({
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
                "Update your profile headline: ",
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
                    TextFormField(
                      minLines: 8,
                      maxLines: 16,
                      maxLength: 240,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Profile Message',  //TODO: Populate with existing profile message
                      ),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Update Headline",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        //tutorProfile.skillLevel = "Elementary";// TODO: onPressed update headline of tutorProfile
                        Navigator.pop(context);
                        print("Update Headline pressed");
                      },
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
