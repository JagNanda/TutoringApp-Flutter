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
  _CreateTutor2SubjectsPageState createState() => _CreateTutor2SubjectsPageState();
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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.tutorProfile.tutorId +
                    ", please add some subjects you would like to tutor in:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.all(20),
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
                    Row(
                      children: [
                        RaisedButton(
                          color: Colors.blue,
                          child: Icon(Icons.home_filled),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            setState(() {
                              widget.tutorProfile.tutoredSubjects = widget.tutorProfile.tutoredSubjects;
                            });
                            // Navigator.of(context).pushNamed( // TODO: Navigate to profile
                            //     '/create_tutor_experience',
                            //     arguments: widget.tutorProfile);
                            print("Home Button Pressed");
                          }, // TODO: onPressed add subjects to delegate and segue to new page
                        ),
                        SizedBox(width: 120),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(20),
                          onPressed: () {
                            setState(() {
                              widget.tutorProfile.tutoredSubjects = widget.tutorProfile.tutoredSubjects;
                            });
                            Navigator.of(context).pushNamed(
                                '/create_tutor_experience',
                                arguments: widget.tutorProfile);
                            print("Continue Pressed"); //TODO: remove debug print
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    SizedBox(
                      child: Text(
                        "Hello," + widget.tutorProfile.tutorId + "!",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                      ),
                      width: double.maxFinite,
                    ),

                    SizedBox(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            return Card( child: ListTile(
                              // child: Padding(
                              //   padding: const EdgeInsets.all(16.0),
                              trailing: Icon(Icons.group_add_outlined),
                              subtitle: Text('<#searching for this> students are interested in this '), // <-- subtitle //TODO: mark for future use
                                title: Text(
                                  subjects[index],
                                  style: TextStyle(fontSize: 22.0),

                                ),
                              onTap: (){
                                  // Create Subject List if Null
                                  if(widget.tutorProfile.tutoredSubjects == null){
                                    // The list of subjects is null
                                    widget.tutorProfile.tutoredSubjects = new List<String>();
                                  }

                                  // List is not null
                                  if(widget.tutorProfile.tutoredSubjects.isNotEmpty){
                                    // The list of subjects is not empty
                                    print("\n"); //TODO: Remove debug code
                                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
                                    print(">>> 'Subjects' is not empty");
                                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
                                    print("\n");
                                    if(widget.tutorProfile.tutoredSubjects.contains(subjects[index])){
                                      // The list of subjects already contains this subject
                                      widget.tutorProfile.tutoredSubjects.remove(subjects[index]); //remove this subject from subjects
                                     }else{
                                      // The list of subjects is not empty, but does not contain this subject
                                      widget.tutorProfile.tutoredSubjects.add(subjects[index]); //TODO: Update Icons for selected courses
                                    }
                                  }else{
                                    // The list of subjects is Empty
                                    widget.tutorProfile.tutoredSubjects.add(subjects[index]);
                                  }
                                  for(int i = 0; i<widget.tutorProfile.tutoredSubjects.length; i++)
                                    {
                                      print(widget.tutorProfile.tutoredSubjects.elementAt(i).toString());
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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 80.0,
        child: RaisedButton(
          color: Colors.grey,
          child: Text(
            "back",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.all(10),
          onPressed: () {
            setState(() {
              widget.tutorProfile.tutoredSubjects = widget.tutorProfile.tutoredSubjects;
            });
            Navigator.of(context).pushNamed('/create_tutor_skill',
                arguments: widget.tutorProfile);
            print("Back Pressed");
          }, // TODO: onPressed add subjects to delegate and segue to new page
        ),
        //padding: EdgeInsets.all(10),),
        padding: EdgeInsets.symmetric(vertical:15.0, horizontal: 160.0),),
      )
    );
  }
}
