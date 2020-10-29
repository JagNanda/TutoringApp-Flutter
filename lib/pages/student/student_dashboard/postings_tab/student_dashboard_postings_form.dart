import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/utils/edutcation_levels.dart';
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
  int budgetMin = 0;
  int budgetMax = 100;
  String description;
  String levelOfEducation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Posting"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CreatePostTextFormField(
                  label: "Post Title",
                  changed: (String val) {
                    postTitle = val;
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Subject"),
                  value: subjectArea,
                  items: subjects.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (String val) {
                    this.setState(() {
                      subjectArea = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Budget: ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: CreatePostTextFormField(
                        label: "Min",
                        inputBorder: OutlineInputBorder(),
                        changed: (String min) {
                          setState(() {
                            budgetMin = int.parse(min);
                            budget = "$budgetMin to $budgetMax";
                          });
                        },
                      ),
                    ),
                    Text(" - ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: CreatePostTextFormField(
                        label: "Max",
                        inputBorder: OutlineInputBorder(),
                        changed: (String max) {
                          setState(() {
                            budgetMax = int.parse(max);
                            budget = "$budgetMin to $budgetMax";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Education Level"),
                  value: levelOfEducation,
                  items: educationLevels
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (String val) {
                    this.setState(() {
                      levelOfEducation = val;
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class CreatePostTextFormField extends StatelessWidget {
  final String label;
  final Function changed;
  final InputBorder inputBorder;

  CreatePostTextFormField({@required this.label, @required this.changed, this.inputBorder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: inputBorder,
          labelText: label,
          isDense: true, // Added this
          contentPadding: EdgeInsets.all(8)),
      onChanged: changed,
    );
  }
}
