import 'package:flutter/material.dart';

class StudentPost {
  String title;
  String subject;
  String levelOfEducation;
  String budgetRange;
  String description;

  StudentPost(
      {@required this.title,
      @required this.subject,
      @required this.levelOfEducation,
      @required this.budgetRange,
      @required this.description});
}
