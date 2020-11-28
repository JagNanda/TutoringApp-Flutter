import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/education_history.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';

import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
import 'login_page.dart';
import 'Settings.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Drawer Menu"),
      ),
      body: new Text("Test"),
    );
  }
}

class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(children: <Widget>[
      new UserAccountsDrawerHeader(
          accountName: new Text("Brandon Sarmany",
              style: TextStyle(
                color: Colors.white,
              )),
          accountEmail: new Text("test@hotmail.com", style: TextStyle(color: Colors.white)),
          currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"))),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://www.sheridancollege.ca/-/media/images/www/campuses/trafalgar/trafalgar-road-campus-sheridan-college_2.ashx?mw=767&hash=8FEB6E0B778B6D8CB017C9B7E58DCCE0131D7847")))),
      new ListTile(
        title: new Text("Home Page"),
        trailing: new Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => new TutorDashboard()));
        },
      ),
      new ListTile(
        title: new Text("Profile"),
        trailing: new Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new MainTutorProfile(tutorProfile)));
        },
      ),
      new ListTile(
        title: new Text("Settings"),
        trailing: new Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Settings()));
        },
      ),
      Container(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: new Text("Logout"),
                    trailing: new Icon(Icons.cancel),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, new MaterialPageRoute(builder: (context) => new LoginPage(tutorProfile)));
                    },
                  ),
                ],
              )))),
      new ListTile(
        title: new Text("Close"),
        trailing: new Icon(Icons.cancel),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ]));
  }
}

EducationHistory educationHistory1 = new EducationHistory(
    schoolName: 'Sheridan College',
    schoolCity: 'Oakville',
    schoolCountry: 'Canada',
    schoolProgramName: 'Software Engineering',
    schoolStartMonth: 'September',
    schoolStartYear: '2017',
    schoolThroughMonth: 'May',
    schoolThroughYear: '2021',
    schoolDescription: 'blah, blah, blah....diploma');

TutorProfile tutorProfile = new TutorProfile(
  tutorId: "Brian Holmes",
  skillLevel: 'Elementary',
  tutoredSubjects: ['Flutter', 'Dart', 'Statistics'],
  tutorExpertise: 'Expert',
  education: [educationHistory1],
  languages: ['English', 'Spanish'],
  languageProficiency: ['Native', 'Basic'],
  hourlyRate: 25.0,
  profileHeadline: 'I will help you understand Flutter!',
  profileOverview: 'Hey there, I love math and I love '
      'helping people explore math in simply ways that '
      'are easy to understand and remember! Send me a '
      'message and see how I can help YOU become a math '
      'WHIZ!',
  profilePicImgUrl: null,
  tutorCountry: 'Canada',
  tutorStreetAdd: '3220 Colebrook Court',
  tutorCity: 'Mississauga',
  tutorProvinceState: 'Ontario',
  tutorPostal: 'L5N3E2',
  isCompleted: true,
);
