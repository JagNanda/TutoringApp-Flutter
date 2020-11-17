import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tutoring_app_flutter/services/student_service.dart';

class TutorProfileListing extends StatefulWidget {
  final String name;
  final String bio;
  final String hourlyRate;
  final bool favorite;
  final String id;
  final List<dynamic> subjects;

  TutorProfileListing({
    this.name,
    this.bio,
    this.hourlyRate,
    this.subjects,
    this.id,
    this.favorite = false,
  });

  @override
  _TutorProfileListingState createState() => _TutorProfileListingState();
}

class _TutorProfileListingState extends State<TutorProfileListing> {
  bool favorite = false;

  String getAllSubjectsString() {
    String subjectsText = "";
    widget.subjects.forEach((subject) {
      subjectsText += "$subject ";
    });
    return subjectsText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(17),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.network('https://via.placeholder.com/80'),
                      ),
                    ),
                    //),
                    Text("\$${widget.hourlyRate} per hour",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${widget.name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Text("Subjects: " + getAllSubjectsString()),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: favorite == true
                    ? Icon(Icons.favorite, color: Colors.pink)
                    : Icon(Icons.favorite_border),
                onTap: () {
                  print("tapped");
                  setState(() {
                    //TODO: database call to save as favorite
                    if (favorite == false) {
                      StudentService().addTutorToFavourites(widget.id);
                    }
                    favorite = !favorite;
                  });
                },
              )
            ],
          ),
          SizedBox(height: 15),
          Text(widget.bio),
        ],
      ),
    );
  }
}
