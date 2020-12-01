import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_request.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class MainTutorProfile extends StatefulWidget {
  final String id;
  final bool viewingOwnProfile;

  MainTutorProfile({this.id, this.viewingOwnProfile = false});
  @override
  _MainTutorProfileState createState() => _MainTutorProfileState();
}

class _MainTutorProfileState extends State<MainTutorProfile> {
  String firstName;
  String lastName;
  String initials;

  Future<TutorProfile> getOwnProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("tutorId");
    print(id);
    var profileInfo = await TutorService().getTutorById(id);
    TutorProfile profile = new TutorProfile(
        tutoredSubjects: new List<String>(),
        languageProficiency: new List<String>(),
        languages: new List<String>());
    for (var subject in profileInfo["tutor"]["subjects"]) {
      profile.tutoredSubjects.add(subject);
    }
    for (var language in profileInfo["tutor"]["languages"]) {
      profile.languages.add(language);
    }
    for (var languageP in profileInfo["tutor"]["languageProficiency"]) {
      profile.languageProficiency.add(languageP);
    }
    profile.tutorCity = profileInfo["tutor"]["city"];
    profile.tutorId = profileInfo["tutor"]["_id"];
    profile.hourlyRate = profileInfo["tutor"]["hourlyRate"].toString();
    profile.tutorExpertise = profileInfo["tutor"]["tutorExpertise"];
    profile.profileOverview = profileInfo["tutor"]["bio"];
    profile.profileHeadline = profileInfo["tutor"]["headline"];
    profile.skillLevel = profileInfo["tutor"]["skillLevel"];
    profile.tutorProvinceState = profileInfo["tutor"]["province"];

    firstName = profileInfo["user"][0]["firstName"];
    lastName = profileInfo["user"][0]["lastName"];
    initials = firstName.substring(0, 1).toUpperCase() + lastName.substring(0, 1).toUpperCase();

    return profile;
  }

  Future<TutorProfile> getTutorProfileById() async {
    var profileInfo = await TutorService().getTutorById(widget.id);
    TutorProfile profile = new TutorProfile(
        tutoredSubjects: new List<String>(),
        languageProficiency: new List<String>(),
        languages: new List<String>());
    for (var subject in profileInfo["tutor"]["subjects"]) {
      profile.tutoredSubjects.add(subject);
    }
    for (var language in profileInfo["tutor"]["languages"]) {
      profile.languages.add(language);
    }
    for (var languageP in profileInfo["tutor"]["languageProficiency"]) {
      profile.languageProficiency.add(languageP);
    }
    profile.tutorCity = profileInfo["tutor"]["city"];
    profile.tutorId = profileInfo["tutor"]["_id"];
    profile.hourlyRate = profileInfo["tutor"]["hourlyRate"].toString();
    profile.tutorExpertise = profileInfo["tutor"]["tutorExpertise"];
    profile.profileOverview = profileInfo["tutor"]["bio"];
    profile.profileHeadline = profileInfo["tutor"]["headline"];
    profile.skillLevel = profileInfo["tutor"]["skillLevel"];
    profile.tutorProvinceState = profileInfo["tutor"]["province"];

    firstName = profileInfo["user"][0]["firstName"];
    lastName = profileInfo["user"][0]["lastName"];
    initials = firstName.substring(0, 1).toUpperCase() + lastName.substring(0, 1).toUpperCase();

    return profile;
  }

  bool usersTutorProfile = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Tutor Profile')),
          ),
          body: FutureBuilder(
              future: widget.viewingOwnProfile == true ? getOwnProfile() : getTutorProfileById(),
              builder: (BuildContext context, AsyncSnapshot<TutorProfile> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return SizedBox(child: CircularProgressIndicator(), width: 70, height: 70);
                } else {
                  return !snapshot.hasData
                      ? Text("No Data")
                      : ListView(children: [
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
                                          "$initials",
                                          style: TextStyle(color: Colors.white, fontSize: 80.0),
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Colors.black.withAlpha(0),
                                        Colors.black12,
                                        Colors.black45
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    "$firstName $lastName",
                                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Location: "),
                              subtitle: Center(
                                  child: Text(snapshot.data.tutorCity +
                                      ", " +
                                      snapshot.data.tutorProvinceState)),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text("Headline: "),
                              subtitle: Center(child: Text(snapshot.data.profileHeadline)),
                            ),
                          ), // Profile Headline Input
                          Card(
                            child: ListTile(
                              title: Text("Bio: "),
                              subtitle: Center(child: Text(snapshot.data.profileOverview)),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ), // Profile Message Input
                          Card(
                            child: ListTile(
                              title: Text("Target student level: "),
                              subtitle: Center(child: Text(snapshot.data.skillLevel)),
                            ),
                          ), // Tutoring Skill Level Input
                          Card(
                            child: ListTile(
                              title: Text('Tutored Subjects: '),
                              subtitle: Column(children: [
                                for (var i in snapshot.data.tutoredSubjects) Text(i),
                              ]),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Tutor Experience: '),
                              subtitle: Center(child: Text(snapshot.data.tutorExpertise)),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Languages: '),
                              subtitle: Row(
                                children: [
                                  SizedBox(width: 100),
                                  Column(children: [
                                    for (var i in snapshot.data.languages) Text(i),
                                  ]),
                                  SizedBox(width: 20),
                                  Column(children: [
                                    for (var i in snapshot.data.languages) Text(' - '),
                                  ]),
                                  SizedBox(width: 20),
                                  Column(children: [
                                    for (var i in snapshot.data.languageProficiency) Text(i),
                                  ]),
                                ],
                              ),
                            ),
                          ), // Languages
                          Card(
                            child: ListTile(
                              title: Text('Hourly rate:'),
                              subtitle: Center(
                                child: Text(snapshot.data.hourlyRate.toString() + '/hr'),
                              ),
                            ),
                          ), // Hourly Rate Input
                          SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: widget.viewingOwnProfile
                                ? RaisedButton(
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                    onPressed: () {
                                      snapshot.data.isEditingProfile = true;
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => CreateTutor3ExperiencePage(
                                                  profile: snapshot.data)));
                                    },
                                    color: Colors.redAccent,
                                  )
                                : RaisedButton(
                                    child: Text(
                                      "Request Session",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                    color: Colors.green,
                                    onPressed: () async {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => SessionRequest(
                                                    tutorId: widget.id,
                                                    cost: snapshot.data.hourlyRate,
                                                    firstName: firstName,
                                                    lastName: lastName,
                                                    initials: initials,
                                                  )));
                                    }),
                          ),
                        ]);
                }
              })),
    );
  }
}
