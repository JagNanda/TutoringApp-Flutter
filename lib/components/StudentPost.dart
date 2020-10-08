import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/constants.dart';

class StudentPost extends StatefulWidget {
  //TODO: make constructor params required after db is connected
  String title;
  String budget;
  String date;

  StudentPost({this.title, this.budget, this.date});

  @override
  _StudentPostState createState() => _StudentPostState();
}

class _StudentPostState extends State<StudentPost> {
  bool favorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Job Title",
                textAlign: TextAlign.left,
                style: kPostTitleText,
              ),
              GestureDetector(
                child: favorite == true
                    ? Icon(Icons.favorite, color: Colors.pink)
                    : Icon(Icons.favorite_border),
                onTap: () {
                  setState(() {
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
                "\$40 an hour",
                style: kPostPriceText,
              ),
              SizedBox(width: 10),
              Text(
                "September 20, 2020",
                style: kPostDateText,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
          ),
        ],
      ),
    );
  }
}
