import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';

class CreateTutor9LocationPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor9LocationPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor9LocationPageState createState() =>
      _CreateTutor9LocationPageState();
}

class _CreateTutor9LocationPageState extends State<CreateTutor9LocationPage> {

  noCityAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No location selected"),
            content: Text("Please enter a city to continue"),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  noProvinceAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No location selected"),
            content: Text("Please enter a province or state to continue"),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
                      initialValue: widget.profile.tutorCity,
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
                      initialValue: widget.profile.tutorProvinceState,
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        print(widget.profile.tutorCity);
                        print(widget.profile.tutorProvinceState);
                        setState(() {});
                        if (widget.profile.tutorCity == null ||
                            widget.profile.tutorProvinceState == null) {
                          if (widget.profile.tutorCity == null) {
                            noCityAlertDialog(context);
                          }
                          if (widget.profile.tutorProvinceState == null) {
                            noProvinceAlertDialog(context);
                          }
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateTutor11SummaryPage(
                                          profile: widget.profile)));
                        }
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
