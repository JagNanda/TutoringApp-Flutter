import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/tutor/tutor_profile_listing.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class StudentDashBoardTutorsSearch extends StatefulWidget {


  @override
  _StudentDashBoardTutorsSearchState createState() => _StudentDashBoardTutorsSearchState();
}

class _StudentDashBoardTutorsSearchState extends State<StudentDashBoardTutorsSearch> {
  List<dynamic> allTutorProfiles;

  String searchString = "";
  bool search = false;
  Future<List<TutorProfileListing>> loadTutorProfiles() async {
    List<dynamic> allProfiles = await TutorService().getTutorProfiles();

    allTutorProfiles = allProfiles;
    return allProfiles.map((post) {
      return TutorProfileListing(
        bio: post["bio"],
        name: "${post["userInfo"]["firstName"]} ${post["userInfo"]["lastName"]}",
        hourlyRate: post["hourlyRate"].toString(),
        subjects: post["subjects"],
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    loadTutorProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadTutorProfiles(),
      builder: (BuildContext context, AsyncSnapshot<List<TutorProfileListing>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(child: CircularProgressIndicator(), width: 70, height: 70);
        } else {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter main subject area",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onChanged: (value) {
                          searchString = value;
                          if (searchString.isEmpty) {
                            setState(() {
                              search = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        if (searchString.isNotEmpty) {
                          setState(() {
                            search = true;
                          });
                        }
                      })
                ],
              ),
              search
                  ? Text("search")
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        //TODO:Return gesture detector that passes tutorInfo to tutor profile page once tutor profile is done
                        return snapshot.data[index];
                      },
                    ),
            ],
          );
        }
      },
    );
  }
}

// TODO: FOR gesture nav
/*
* onPressed: ()  {//TODO remove
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainTutorProfile(tutorProfile)));
                  },
* */