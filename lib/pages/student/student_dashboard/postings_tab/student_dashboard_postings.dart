import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/student/student_dashboard/postings_tab/student_dashboard_postings_form.dart';

class StudentDashboardPostings extends StatefulWidget {
  @override
  _StudentDashboardPostingsState createState() => _StudentDashboardPostingsState();
}

class _StudentDashboardPostingsState extends State<StudentDashboardPostings> {
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
              }
            },
          )
        ],
        title: Text("My Postings"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text("postings"),
          )
        ],
      ),
    );
  }
}
