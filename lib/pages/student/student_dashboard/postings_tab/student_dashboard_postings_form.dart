import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/utils/subjects.dart';

class StudentDashboardPostingsForm extends StatefulWidget {
  @override
  _StudentDashboardPostingsFormState createState() => _StudentDashboardPostingsFormState();
}

class _StudentDashboardPostingsFormState extends State<StudentDashboardPostingsForm> {
  final _formKey = GlobalKey<FormState>();
  String postTitle;
  String subjectArea;
  String budget;
  String description;
  String levelOfEducation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Form"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Posting Title",
                    labelText: "Posting Title",
                  ),
                )
              ],
            ),
          )),
    );
  }
}
