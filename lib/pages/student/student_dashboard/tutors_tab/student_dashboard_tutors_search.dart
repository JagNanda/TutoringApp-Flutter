import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/tutor/tutor_profile_listing.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class StudentDashBoardTutorsSearch extends StatefulWidget {
  @override
  _StudentDashBoardTutorsSearchState createState() => _StudentDashBoardTutorsSearchState();
}

class _StudentDashBoardTutorsSearchState extends State<StudentDashBoardTutorsSearch> {
  final textController = TextEditingController();
  bool search = false;
  bool isEmpty = false;
  Future<List<TutorProfileListing>> loadTutorProfiles() async {
    List<dynamic> allProfiles = await TutorService().getTutorProfiles();

    return allProfiles.map((post) {
      //TODO:Return gesture detector wrapper that passes a tutorId to tutor profile page one profile page is done
      return TutorProfileListing(
        id: post["_id"],
        bio: post["bio"],
        name: "${post["userInfo"]["firstName"]} ${post["userInfo"]["lastName"]}",
        hourlyRate: post["hourlyRate"].toString(),
        subjects: post["subjects"],
      );
    }).toList();
  }

  Future<List<TutorProfileListing>> loadSearchTutorProfiles() async {
    List<dynamic> allMatchingProfiles =
        await TutorService().getTutorProfilesBySubject(textController.text);

    return allMatchingProfiles.map((post) {
      //TODO:Return gesture detector wrapper that passes a tutorId to tutor profile page one profile page is done
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
    textController.addListener(isTextFieldEmpty);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void isTextFieldEmpty() {
    if (textController.text.isEmpty) {
      print("empty");
      setState(() {
        search = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: search == true ? loadSearchTutorProfiles() : loadTutorProfiles(),
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
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: "Enter main subject area",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        if (textController.text.isNotEmpty) {
                          setState(() {
                            search = true;
                          });
                        }
                      })
                ],
              ),
              snapshot.data.length == 0
                  ? Text("No Results")
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data[index];
                        },
                      ),
                    ),
            ],
          );
        }
      },
    );
  }
}
