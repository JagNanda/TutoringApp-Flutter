import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';

class CreateTutor2SubjectsPage extends StatefulWidget {
  final TutorProfile tutorProfile;

  //final List<String> subjects; // = (_)=>{subjects.add("")};

  const CreateTutor2SubjectsPage({
    Key key,
    @required this.tutorProfile, //this.subjects
  }) : super(key: key);

  @override
  _CreateTutor2SubjectsPageState createState() =>
      _CreateTutor2SubjectsPageState();
}

class _CreateTutor2SubjectsPageState extends State<CreateTutor2SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    // region creates subject list 'List<String> subjects'
    List<String> subjects = [
      "Math",
      "Science",
      "Geography",
      "History",
      "Flutter",
      "MongoDB",
      "Dart",
      "Github",
      "Express JS",
      "Social Science",
      "Algebra",
      "Calculus",
      "Trigonometry",
      "Physics",
      "Art",
      "Statistics",
      "Computer Science",
      "Computer Programming",
      "Biology",
      "Chemistry",
      "Engineering",
      "Accounting",
      "Business",
      "Law",
      "Kinesiology",
      "Medicine",
      "Animation",
      "3d Programming",
      "Early Childhood Education",
      "Psychology",
      "Psychiatry",
      "Electrical Engineering",
      "Marketing",
      "Human Resources",
      "Pharmacy",
      "Policing",
      "Project Management",
    ];
    // endregion creates subject list

    Color color = Colors.blueGrey;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.tutorProfile.tutorId +
                    ", please add some subjects you would like to tutor:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(20),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                for (var sub in tutorProfile.tutoredSubjects) Text(sub),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [

                    SizedBox(height: 10),
                    SizedBox(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                                //tileColor: color,
                                title: Text(
                                  subjects[index],
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                subtitle: Text('Tap to add/remove a subject'),
                                // <-- subtitle //TODO: mark for future use
                                //trailing: Icon(Icons.group_add_outlined, color: color,),
                            onTap: () {
                              setState(() {
                                tutorProfile.tutoredSubjects = tutorProfile.tutoredSubjects;
                                color = Colors.red;
                              });

                              // Create Subject List if Null
                              if (widget.tutorProfile.tutoredSubjects == null) {
                                // The list of subjects is null
                                widget.tutorProfile.tutoredSubjects =
                                    new List<String>();
                                // TODO: onTap Change Icon/card to indicate selected

                              }

                              // List is not null
                              if (widget
                                  .tutorProfile.tutoredSubjects.isNotEmpty) {
                                if (widget.tutorProfile.tutoredSubjects
                                    .contains(subjects[index])) {
                                  // The list of subjects already contains this subject
                                  widget.tutorProfile.tutoredSubjects.remove(
                                      subjects[
                                          index]); //remove this subject from subjects
                                } else {
                                  // The list of subjects is not empty, but does not contain this subject
                                  widget.tutorProfile.tutoredSubjects.add(subjects[
                                      index]); //TODO: Update Icons for selected courses
                                }
                              } else {
                                // The list of subjects is Empty
                                widget.tutorProfile.tutoredSubjects
                                    .add(subjects[index]);
                              }
                              for (int i = 0;
                                  i <
                                      widget
                                          .tutorProfile.tutoredSubjects.length;
                                  i++) {
                                print(widget.tutorProfile.tutoredSubjects
                                    .elementAt(i)
                                    .toString());
                              }
                            },
                            //),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              "Update Tutored subjects with selections",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(20),
            onPressed: () {
              setState(() {
                widget.tutorProfile.tutoredSubjects =
                    widget.tutorProfile.tutoredSubjects;
              });
              Navigator.pop(context);
              print(
                  "Update Tutored subjects with selections"); //TODO: remove debug print
            },
          ),
        ],
      ),
    );
  }
}
