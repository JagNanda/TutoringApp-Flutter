import 'package:flutter/material.dart';

class LearnPortalButton extends StatelessWidget {


  LearnPortalButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        color: Colors.blue,
        child: Column(children: [
          Text(
            "I'm here to learn!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Text(
            "Click here to find your tutor!",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(20),
        onPressed: () {
          print("'Here to Learn' Pressed");
//Navigator.of(context).pushNamed('/create_tutor_education', arguments: tutorProfile);
        }, // TODO: onPressed add tutorExpertise to delegate and segue to new page
      ),
      width: double.maxFinite,
    );
  }
}
