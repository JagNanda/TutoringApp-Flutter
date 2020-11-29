import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/session_request.dart';
import 'package:tutoring_app_flutter/main.dart';

import 'package:tutoring_app_flutter/models/tutor_profile.dart';

import 'all_create_tutor_pages.dart';

class MainTutorProfile extends StatefulWidget {
  final int id;
  MainTutorProfile({this.id});

  @override
  _MainTutorProfileState createState() => _MainTutorProfileState();
}

class _MainTutorProfileState extends State<MainTutorProfile> {
  TutorProfile tutorProfile;
  // TODO: dataBase call to create tutorProfile object if exists, otherwise create new
  bool usersTutorProfile = false;
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
              title: Center(child: Text(tutorProfile.profileHeadline)),
            ),
          ), // Profile Headline Input
          Card(
            child: ListTile(
              title: Center(child: Text(tutorProfile.profileOverview)),
              contentPadding: const EdgeInsets.all(10),
            ),
          ), // Profile Message Input
          Card(
            child: ListTile(
              title: Center(child: Text(tutorProfile.skillLevel + ' level tutor')),
            ),
          ), // Tutoring Skill Level Input
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
              title: Center(
                child: Text('Subject expertise: ' + tutorProfile.tutorExpertise + ' level'),
              ),
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
          ), // Languages
          Card(
            child: ListTile(
              title: Center(
                child: Text('Hourly rate: \$' + tutorProfile.hourlyRate.toString() + '/hr'),
              ),
            ),
          ), // Hourly Rate Input
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            height: 50,
            child: RaisedButton(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed:
                    null), //TODO: Change color of button and text to -> "tap field to edit", and enable GestureDetectors
          ),
        ]),
      ),
    );
  }
}
