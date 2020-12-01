import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
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
  bool favorite;

  String getAllSubjectsString() {
    String subjectsText = "";
    widget.subjects.forEach((subject) {
      subjectsText += "$subject ";
    });
    return subjectsText;
  }

  @override
  void initState() {
    super.initState();
    favorite = widget.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainTutorProfile(
                      id: widget.id,
                    )));
      },
      child: Container(
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
                  onTap: () async {
                    if (favorite == false) {
                      await StudentService().addTutorToFavourites(widget.id);
                    } else if (favorite == true) {
                      await StudentService().removeTutorInFavourites(widget.id);
                    }
                    setState(() {
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
      ),
    );
  }
}
