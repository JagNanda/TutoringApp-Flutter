import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/main_tutorProfile.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';

class CreateTutor6HourlyPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor6HourlyPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor6HourlyPageState createState() => _CreateTutor6HourlyPageState();
}

class _CreateTutor6HourlyPageState extends State<CreateTutor6HourlyPage> {
  noHourlyRateAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Hourly Rate"),
            content: Text("Please input your desired hourly rate to continue"),
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

  completeProfileAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Profile Overview"),
            content: Text("Use your Overview to tell students how you can help them learn"),
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
                        new TextFormField(
                          initialValue: widget.profile.hourlyRate,
                          decoration:
                              new InputDecoration(labelText: "Update your hourly rate in \$:"),
                          onChanged: (String val) {
                            widget.profile.hourlyRate = val;
                            setState(() {});
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        if (widget.profile.hourlyRate != null)
                          Text(widget.profile.hourlyRate.toString()),
                        if (widget.profile.hourlyRate == null) Text("0.00"),
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
                      onPressed: () async {
                        if (widget.profile.hourlyRate == null) {
                          noHourlyRateAlertDialog(context);
                        } else {
                          if (widget.profile.isEditingProfile == true) {
                            print('>>> Editing Profile <<<');
                            //TODO: edit profile api call
                            // bool updated = await TutorService().updateTutorProfile(widget.profile);
                            // print(updated);
                            //  if (Navigator.canPop(context)) {
                            //    Navigator.of(context).popUntil(
                            //        ModalRoute.withName('/portal'));
                            //  }
                          } else {
                            print('>>> Creating New Profile <<<');
                            bool created = await TutorService().createTutorProfile(widget.profile);
                            print(created);
                            if (created && Navigator.canPop(context)) {
                              Navigator.of(context).popUntil(ModalRoute.withName('/portal'));
                            }
                          }
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
