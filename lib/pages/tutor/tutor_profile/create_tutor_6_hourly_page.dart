import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';


class CreateTutor6HourlyPage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor6HourlyPage({
    Key key,
    @required this.tutorProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add hourly rate:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(30),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                  SizedBox(height: 10),
                  Column(
                    children: [
                      new TextField(
                      decoration: new InputDecoration(labelText: "Update your hourly rate in \$:"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly],
                      ),
                    ],
                  ),
                    SizedBox(height: 10),
                    Column(
                     children: [
                       if(tutorProfile.hourlyRate!=null) Text(tutorProfile.hourlyRate.toString()),
                       if(tutorProfile.hourlyRate==null) Text("0.00"),
                     ],
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        //_tutorProfile.skillLevel = "Elementary";
                        Navigator.pop(context);
                        print("Done Pressed");
                      }, // TODO: onPressed add skillLevel to delegate and segue to new page
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
*
* NumberPicker.integer(
                initialValue: _currentValue,
                minValue: 0,
                maxValue: 100,
                onChanged: (newValue) =>
                    setState(() => _currentValue = newValue)),
*
* */
