import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';


class CreateTutor7OverviewPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor7OverviewPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor7OverviewPageState createState() => _CreateTutor7OverviewPageState();
}

class _CreateTutor7OverviewPageState extends State<CreateTutor7OverviewPage> {

  noOverviewAlertDialog(BuildContext context) {
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
                "Update your profile overview: ",
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
                    TextFormField(
                      minLines: 8,
                      maxLines: 16,
                      maxLength: 240,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Profile Overview',  //TODO: Populate with existing profile message
                      ),
                      onChanged: (String val) {
                        widget.profile.profileOverview = val;
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Update Profile Messsage",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        setState(() {});
                        if(widget.profile.profileOverview == null || widget.profile.profileOverview.isEmpty){
                          noOverviewAlertDialog(context);
                        }
                        else
                        {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateTutor6HourlyPage(profile: widget.profile)));
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
