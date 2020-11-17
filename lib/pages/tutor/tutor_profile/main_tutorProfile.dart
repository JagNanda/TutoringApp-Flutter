import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/session_request.dart';
import 'package:tutoring_app_flutter/main.dart';

import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'MyBackButton.dart';

class MainTutorProfile extends StatefulWidget {
  final TutorProfile tutorProfile;

  MainTutorProfile(this.tutorProfile);

  @override
  _MainTutorProfileState createState() => _MainTutorProfileState();
}

class _MainTutorProfileState extends State<MainTutorProfile> {
  // TODO: dataBase call to create tutorProfile object if exists, otherwise create new

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Tutor Profile')),
        ),
        body: ListView(children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
                ),
                Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 90,
                      child: Text(
                        'BH',
                        style: TextStyle(color: Colors.white, fontSize: 80.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black.withAlpha(0), Colors.black12, Colors.black45],
                    ),
                  ),
                  child: Text(
                    tutorProfile.tutorId, //TODO: Get name from userID
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 10),
                RaisedButton(
                    child: Text(
                      "Send Message",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: null),
                SizedBox(width: 70),
                RaisedButton(
                    child: Text(
                      "Request Session",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => new SessionRequest()));
                    }),
              ],
            ),
          ),
          Card(
            child: ListTile(
              title: Text(tutorProfile.tutorId), //TODO: Get name from userID
              subtitle: Text(tutorProfile.tutorCity + ', ' + tutorProfile.tutorCountry),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(tutorProfile.profileHeadline),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(tutorProfile.profileOverview),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(tutorProfile.skillLevel + ' level tutor'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tutored Subjects: '),
              subtitle: Column(children: [
                for (var i in tutorProfile.tutoredSubjects) Text(i),
              ]),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Subject expertise: ' + tutorProfile.tutorExpertise + ' level'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Languages: '),
              subtitle: Row(
                children: [
                  SizedBox(width: 100),
                  Column(children: [
                    for (var i in tutorProfile.languages) Text(i),
                  ]),
                  SizedBox(width: 20),
                  Column(children: [
                    for (var i in tutorProfile.languages) Text(' - '),
                  ]),
                  SizedBox(width: 20),
                  Column(children: [
                    for (var i in tutorProfile.languageProficiency) Text(i),
                  ]),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Hourly rate: \$' + tutorProfile.hourlyRate.toString() + '/hr'),
            ),
          ),
          SizedBox(height: 20),
          /*Column(
            children: [
              Text('For Internal use Only: '),
              SizedBox(width: 10),
              Text(tutorProfile.tutorStreetAdd),
              Text(tutorProfile.tutorCity),
              Text(tutorProfile.tutorProvinceState),
              Text(tutorProfile.tutorPostal),
              Text(tutorProfile.tutorCountry),
            ],
          ),*/
        ]),
      ),
    );
  }
}

/*
* //NOTE: Back button may not be needed (use system)
            // SizedBox(height: 20),
            //
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.bottomCenter,
            //     child: RaisedButton(
            //       color: Colors.grey,
            //       child: Text("Back",
            //         style: TextStyle(color: Colors.white, fontSize: 18),
            //       ),
            //       shape:
            //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            //       padding: EdgeInsets.all(20),
            //       onPressed: () {
            //         Navigator.pop(context);
            //         print("Back Pressed");
            //       }, // TODO: onPressed segue to previous page
            //     ),
            //     padding: EdgeInsets.all(20),
            //   ),
            // ),
*
*
*
* */
