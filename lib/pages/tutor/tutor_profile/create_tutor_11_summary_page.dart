import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';


class CreateTutor11SummaryPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor11SummaryPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor11SummaryPageState createState() => _CreateTutor11SummaryPageState();
}

class _CreateTutor11SummaryPageState extends State<CreateTutor11SummaryPage> {

  noHeadlineAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No Headline!"),
            content: Text("Give your profile a headline to continue"),
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
                "Update your profile headline: ",
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Profile Headline',  //TODO: Populate with existing headline
                      ),
                      onChanged: (String val) {
                        widget.profile.profileHeadline = val;
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Update Headline",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        setState(() {});
                        if(widget.profile.profileHeadline == null){
                          print(">>>  ALERT DIALOG  <<<<");  //TODO: REMOVE PRINT STATEMENT
                          noHeadlineAlertDialog(context);
                        }
                        else
                        {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CreateTutor7OverviewPage(profile: widget.profile)));
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
