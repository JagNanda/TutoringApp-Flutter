import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/student/student_post_listing.dart';
import 'package:tutoring_app_flutter/services/student_post_service.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class TutorDashboardJobsSearchPage extends StatefulWidget {
  @override
  _TutorDashboardJobsSearchPageState createState() => _TutorDashboardJobsSearchPageState();
}

class _TutorDashboardJobsSearchPageState extends State<TutorDashboardJobsSearchPage> {
  final textController = TextEditingController();
  bool search = false;
  bool isSearchEmpty = false;
  List<dynamic> allPosts;
  List<dynamic> favoritedPosts;

  @override
  void initState() {
    super.initState();
    textController.addListener(isTextFieldEmpty);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Future<List<StudentPostListing>> loadStudentPostings() async {
    allPosts = await StudentPostService().getAllPosts();
    //check if of the posts are favorited already
    favoritedPosts = await TutorService().getFavouritePosts();
    return allPosts.map((post) {
      String id = post["_id"];
      bool favorited = false;
      favoritedPosts.forEach((element) {
        if (element["_id"] == id) {
          favorited = true;
        }
      });
      return StudentPostListing(
        id: id,
        title: post["title"],
        subject: post["subject"],
        levelOfEducation: post["levelOfEducation"],
        budgetRange: post["budgetRange"],
        showSavedIcon: true,
        date: post["date"],
        description: post["description"],
        favorite: favorited,
      );
    }).toList();
  }

  Future<List<StudentPostListing>> loadStudentPostingsBySubject(String subject) async {
    allPosts = await StudentPostService().getAllPostsBySubject(subject);
    return allPosts.map((post) {
      return StudentPostListing(
        title: post["title"],
        subject: post["subject"],
        levelOfEducation: post["levelOfEducation"],
        budgetRange: post["budgetRange"],
        showSavedIcon: true,
        date: post["date"],
        description: post["description"],
      );
    }).toList();
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
      future: search == true
          ? loadStudentPostingsBySubject(textController.text)
          : loadStudentPostings(),
      builder: (BuildContext context, AsyncSnapshot<List<StudentPostListing>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(child: CircularProgressIndicator(), width: 70, height: 70);
        } else {
          return !snapshot.hasData
              ? Text("No Data")
              : Column(
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
                        ? Center(
                            child: Text(
                            "There are no student postings available",
                            textAlign: TextAlign.center,
                          ))
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
