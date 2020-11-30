import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/student/student_post_listing.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class TutorDashboardJobFavourites extends StatefulWidget {
  @override
  _TutorDashboardJobFavouritesState createState() => _TutorDashboardJobFavouritesState();
}

class _TutorDashboardJobFavouritesState extends State<TutorDashboardJobFavourites> {
  List<dynamic> allPosts;

  Future<List<StudentPostListing>> loadStudentPostings() async {
    allPosts = await TutorService().getFavouritePosts();
    return allPosts.map((post) {
      return StudentPostListing(
        id: post["_id"],
        title: post["title"],
        subject: post["subject"],
        levelOfEducation: post["levelOfEducation"],
        budgetRange: post["budgetRange"],
        showSavedIcon: true,
        date: post["date"],
        description: post["description"],
        favorite: true,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadStudentPostings(),
      builder: (BuildContext context, AsyncSnapshot<List<StudentPostListing>> snapshot) {
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
                              "No Saved Posts",
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
