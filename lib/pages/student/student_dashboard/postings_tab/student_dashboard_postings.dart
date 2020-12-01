import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/student/student_post_listing.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/postings_tab/student_dashboard_postings_form.dart';
import 'package:tutoring_app_flutter/services/student_post_service.dart';

class StudentDashboardPostings extends StatefulWidget {
  @override
  _StudentDashboardPostingsState createState() => _StudentDashboardPostingsState();
}

class _StudentDashboardPostingsState extends State<StudentDashboardPostings> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<StudentPostListing>> loadPosts() async {
    List<dynamic> allPostsRequest = await StudentPostService().getAllPostsByUserId();
    //get user object for first name and last name
    return allPostsRequest
        .map((post) {
          return StudentPostListing(
            title: post["title"],
            subject: post["subject"],
            levelOfEducation: post["levelOfEducation"],
            budgetRange: post["budgetRange"],
            description: post["description"],
            date: post["date"],
          );
        })
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.add, size: 30),
            ),
            onTap: () async {
              bool postingSuccessful = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentDashboardPostingsForm()),
              );
              if (postingSuccessful == true) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Your posting was successfully created.")));
                setState(() {});
              }
            },
          )
        ],
        title: Text("My Postings"),
      ),
      body: FutureBuilder(
        future: loadPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<StudentPostListing>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return SizedBox(child: CircularProgressIndicator(), width: 70, height: 70);
          } else {
            return snapshot.data.length == 0
                ? Center(
                    child: Text(
                    "You haven't created any Posts yet.",
                    textAlign: TextAlign.center,
                  ))
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return snapshot.data[index];
                    },
                  );
          }
        },
      ),
    );
  }
}
