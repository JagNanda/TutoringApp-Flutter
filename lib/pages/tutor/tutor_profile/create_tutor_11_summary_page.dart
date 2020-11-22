import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor11SummaryPage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor11SummaryPage({
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
                "View Summary and confirm:",
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
                    // RaisedButton(
                    //   color: Colors.blue,
                    //   child: Text(
                    //     "Finish",
                    //     style: TextStyle(color: Colors.white, fontSize: 18),
                    //   ),
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    //   padding: EdgeInsets.all(20),
                    //   onPressed: (){
                    //     //tutorProfile.skillLevel = "Elementary";
                    //     print("Finish Pressed");
                    //   }, // TODO: onPressed add skillLevel to delegate and segue to new page
                    // ),
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
