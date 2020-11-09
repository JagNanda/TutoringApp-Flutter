import 'package:flutter/material.dart';

class TutorProfileListing extends StatefulWidget {
  final String name;
  final String bio;
  final String hourlyRate;
  final List<dynamic> subjects;

  TutorProfileListing({this.name, this.bio, this.hourlyRate, this.subjects});

  @override
  _TutorProfileListingState createState() => _TutorProfileListingState();
}

class _TutorProfileListingState extends State<TutorProfileListing> {
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
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network('https://via.placeholder.com/80'),
                    ),
                  ),
                  Text("\$${widget.hourlyRate} per hour",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              Expanded(
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
