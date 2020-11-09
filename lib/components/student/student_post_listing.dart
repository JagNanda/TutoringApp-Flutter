import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';

class StudentPostListing extends StatefulWidget {
  //TODO: make constructor params required after db is connected
  final String title;
  final String budgetRange;
  final String date;
  final String levelOfEducation;
  final String subject;
  final String description;
  final bool showSavedIcon; //dont want the student to be able to favorite their own posts

  StudentPostListing({
    @required this.title,
    this.budgetRange,
    this.date,
    this.levelOfEducation,
    this.subject,
    this.description,
    this.showSavedIcon = false,
  });

  @override
  _StudentPostListingState createState() => _StudentPostListingState();
}

class _StudentPostListingState extends State<StudentPostListing> {
  //TODO: remove favorite and put in the constructor instead after db implementation
  bool favorite = false;
  bool isExpanded = false;
  String longDescription;
  String shortDescription;

  @override
  void initState() {
    super.initState();
    // TODO: Remove longDescription after db implementation
    longDescription = widget.description;
    // TODO: description must be over 40 characters so this will always work
    shortDescription = longDescription.substring(0, 39);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //TODO: Replace placeholder text with class variables
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.left,
                style: kPostTitleText,
              ),
              if (widget.showSavedIcon == true)
                GestureDetector(
                  child: favorite == true
                      ? Icon(Icons.favorite, color: Colors.pink)
                      : Icon(Icons.favorite_border),
                  onTap: () {
                    setState(() {
                      //TODO: database call to save as favorite
                      favorite = !favorite;
                    });
                  },
                )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                "\$${widget.budgetRange} per hour",
                style: kPostBoldText,
              ),
              SizedBox(width: 10),
              Text(
                widget.date,
                style: kPostDateText,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Subject", style: kPostSmallText),
                    Text(widget.subject, style: kPostBoldText)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Expertise Needed", style: kPostSmallText),
                    Text(widget.levelOfEducation, style: kPostBoldText)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(isExpanded ? longDescription : shortDescription),
              GestureDetector(
                child: Text(
                  isExpanded == true ? "show less" : "show more",
                  style: TextStyle(color: Colors.blue[900]),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
