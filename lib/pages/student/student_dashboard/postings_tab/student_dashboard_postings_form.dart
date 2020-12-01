import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutoring_app_flutter/models/student_post.dart';
import 'package:tutoring_app_flutter/services/student_post_service.dart';
import 'package:tutoring_app_flutter/utils/education_levels.dart';
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CreatePostTextFormField(
                    label: "Post Title",
                    changed: (String val) {
                      postTitle = val;
                    },
                    fieldMaxLength: 40,
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
                          numsOnly: true,
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
                          numsOnly: true,
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
                  SizedBox(height: 20),
                  CreatePostTextFormField(
                    label: "Description",
                    inputBorder: OutlineInputBorder(),
                    fieldMaxLength: 240,
                    multiLine: true,
                    changed: (String val) {
                      description = val;
                    },
                    useValidator: true,
                    validatorFunc: (val) {
                      if (description.length < 40) {
                        return "Description is too short!";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Create Posting",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          StudentPost newPost = StudentPost(
                              title: postTitle,
                              budgetRange: budget,
                              description: description,
                              levelOfEducation: levelOfEducation,
                              subject: subjectArea);
                          var postSuccessful = await StudentPostService().createPost(newPost);
                          if (postSuccessful == true) {
                            Navigator.pop(context, postSuccessful);
                          }
                        }
                      },
                      padding: EdgeInsets.all(20),
                    ),
                    width: double.maxFinite,
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class CreatePostTextFormField extends StatelessWidget {
  final String label;
  final Function changed;
  final InputBorder inputBorder;
  final bool multiLine;
  final bool useValidator;
  final Function validatorFunc;
  final int fieldMaxLength;
  final bool numsOnly;

  CreatePostTextFormField({
    @required this.label,
    @required this.changed,
    this.inputBorder,
    this.multiLine = false,
    this.useValidator = false,
    this.validatorFunc,
    this.fieldMaxLength,
    this.numsOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: inputBorder,
        labelText: label,
        isDense: true,
        contentPadding: EdgeInsets.all(10),
      ),
      keyboardType: multiLine == true
          ? TextInputType.multiline
          : numsOnly
              ? TextInputType.number
              : TextInputType.text,
      maxLines: multiLine == true ? 10 : 1,
      maxLength: fieldMaxLength,
      onChanged: changed,
      inputFormatters: numsOnly
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ]
          : null,
      validator: useValidator == true
          ? validatorFunc
          : (val) {
              return null;
            },
    );
  }
}
