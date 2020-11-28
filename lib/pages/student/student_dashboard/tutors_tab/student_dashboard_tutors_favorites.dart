import "package:flutter/material.dart";
import 'package:tutoring_app_flutter/components/tutor/tutor_profile_listing.dart';
import 'package:tutoring_app_flutter/services/student_service.dart';

class StudentDashboardTutorsFavorites extends StatefulWidget {
  @override
  _StudentDashboardTutorsFavoritesState createState() => _StudentDashboardTutorsFavoritesState();
}

class _StudentDashboardTutorsFavoritesState extends State<StudentDashboardTutorsFavorites> {
  Future<List<TutorProfileListing>> loadTutorProfiles() async {
    List<dynamic> favouriteProfiles = await StudentService().getFavouriteTutors();

    List<TutorProfileListing> profiles = favouriteProfiles.map((profile) {
      return TutorProfileListing(
        id: profile["_id"],
        bio: profile["bio"],
        name: "${profile["userInfo"]["firstName"]} ${profile["userInfo"]["lastName"]}",
        hourlyRate: profile["hourlyRate"].toString(),
        subjects: profile["subjects"],
        favorite: true,
      );
    }).toList();
    return profiles;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTutorProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadTutorProfiles(),
      builder: (BuildContext context, AsyncSnapshot<List<TutorProfileListing>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(child: CircularProgressIndicator(), width: 20, height: 20);
        } else {
          return Column(
            children: [
              !snapshot.hasData
                  ? Text("no data")
                  : snapshot.data.length > 0
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return snapshot.data[index];
                          },
                        )
                      : Expanded(
                          child: Center(
                            child: Text(
                              "No Saved Tutors",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
            ],
          );
        }
      },
    );
  }
}
