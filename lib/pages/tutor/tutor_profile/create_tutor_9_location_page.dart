import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'package:validators/validators.dart';

class CreateTutor9LocationPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor9LocationPage({
    Key key,
    @required this.profile, //this.subjects
  }) : super(key: key);


  @override
  _CreateTutor9LocationPageState createState() => _CreateTutor9LocationPageState();
}

class _CreateTutor9LocationPageState extends State<CreateTutor9LocationPage> {
  // String city = "";
  // String province = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add location:",
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
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City',
                      ),
                      onChanged: (String val) {
                        widget.profile.tutorCity = val;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'State / Province',
                      ),
                      onChanged: (String val) {
                        widget.profile.tutorProvinceState = val;
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Update Location",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        //tutorProfile.skillLevel = "Elementary";// TODO: onPressed add skillLevel to tutorProfile
                        Map<String, String> location = {"city": widget.profile.tutorCity, "province": widget.profile.tutorProvinceState};
                        print(widget.profile.tutorCity + " , " + widget.profile.tutorProvinceState);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => CreateTutor11SummaryPage(profile: widget.profile)));
                      },
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
