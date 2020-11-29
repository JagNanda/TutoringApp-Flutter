import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/education_history.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/services/tutor_service.dart';
import 'pages/tutor/tutor_profile/learnPortalButton.dart';
//import 'pages/tutor/tutor_profile/teachPortalButton.dart';

//moved to fix errors on my side,
TutorProfile tutorProfile = new TutorProfile(tutorId: "1");
class PortalPage extends StatefulWidget {

  //final TutorProfile tutorProfile;
  @override
  _PortalPageState createState() => _PortalPageState();
}

class _PortalPageState extends State<PortalPage> {
  @override
  void initState() {
    super.initState();
  }

// class PortalPage extends StatelessWidget {
//   @override

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
                    LearnPortalButton(),
                    SizedBox(height: 10),
                    TeachPortalButton(context),
                  ],
                ),
              ),
            ),
          ),
          // TODO: Encapsulate Back Button (below)
          // Expanded(
          //   child: Container(
          //     alignment: Alignment.bottomCenter,
          //     child: RaisedButton(
          //       color: Colors.grey,
          //       child: Text(
          //         "Back",
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30)),
          //       padding: EdgeInsets.all(20),
          //       onPressed: () {
          //         print("Back Pressed");
          //       }, // TODO: onPressed segue to previous page
          //     ),
          //     padding: EdgeInsets.all(20),
          //   ),
          // )
        ],
      ),
    );
  }

  SizedBox TeachPortalButton(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        color: Colors.blue,
        child: Column(children: [
          Text(
            "I'm here to teach!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            "Click here to connect with students!",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(20),
        onPressed: () {
        // onPressed: () async {
          // final sharedPrefs = await SharedPreferences.getInstance();
          // String userId = sharedPrefs.getString('userId') ?? "";
          //
          // var user = TutorService().tutorProfileCheck(userId);
          // // TODO : check if user already has a tutoProfile (if not, create one)
          //
          // print(">>>>>> test \n");
          // print(user);
          // // if(user['tutorId'])
          //   {}

          tutorProfile = tutorProfile; // TODO : Update default constructor
          Navigator.of(context)
              .pushNamed('/main_tutorProfile', arguments: tutorProfile);
          print("'Here to Teach' Pressed");
          //Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
        }, // TODO: onPressed add tutorExpertise to delegate and segue to new page
      ),
      width: double.maxFinite,
    );
  }
}
