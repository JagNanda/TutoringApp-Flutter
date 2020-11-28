import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:validators/validators.dart' as validator;

class CreateTutor10PhonePage extends StatelessWidget {
  final TutorProfile tutorProfile;

  const CreateTutor10PhonePage({
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
                "Update Contact information:",
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
                    TextFormField(),

                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: (){
                        //tutorProfile.skillLevel = "Elementary";
                        Navigator.of(context).pushNamed('/create_tutor_summary', arguments: tutorProfile);
                        print("Next Pressed");
                      }, // TODO: onPressed add skillLevel to delegate and segue to new page
                    ),
                    SizedBox(height: 30),
                    Text('For Internal use Only: '),
                    SizedBox(width: 10),
                    Text(tutorProfile.tutorStreetAdd),
                    Text(tutorProfile.tutorCity),
                    Text(tutorProfile.tutorProvinceState),
                    Text(tutorProfile.tutorPostal),
                    Text(tutorProfile.tutorCountry),
                    Text(tutorProfile.phone)
                ]
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


class ContactTextFormField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final bool isName;
  final bool isEmail;
  final IconData icon;
  final Function onChange;

  ContactTextFormField(
      {@required this.hint,
        @required this.icon,
        @required this.onChange,
        this.isPassword = false,
        this.isEmail = false,
        this.isName = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          hintText: hint,
          prefixIcon: Icon(icon),
          labelText: hint,
        ),
        obscureText: isPassword == true ? true : false,
        showCursor: false,
        validator: (val) {
          if (val.isEmpty) {
            return "Please enter a value";
          }
          if (isEmail && !validator.isEmail(val)) {
            return "Please Enter a valid email";
          } else if (isName && !validator.isAlpha(val)) {
            return "Please enter a valid name";
          }
          return null;
        },
        onChanged: onChange,
      ),
    );
  }
}
