// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tutoring_app_flutter/components/sessions/session_request.dart';
// import 'package:tutoring_app_flutter/main.dart';
//
// import 'package:tutoring_app_flutter/models/tutor_profile.dart';
// import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/ListItem.dart';
//
// import 'all_create_tutor_pages.dart';
//
// class CreateNewTutorProfile extends StatefulWidget {
//   //final TutorProfile profile;
//
//   // CreateNewTutorProfile(this.profile);
//   CreateNewTutorProfile();
//
//   @override
//   _CreateNewTutorProfileState createState() => _CreateNewTutorProfileState();
// }
//
// class _CreateNewTutorProfileState extends State<CreateNewTutorProfile> {
//   // region ListItems
//   List<ListItem> _languageDropdownItems = [
//     ListItem(1, "Please select a language"),
//     ListItem(2, "English"),
//     ListItem(3, "French"),
//     ListItem(4, "Spanish"),
//     ListItem(5, "Mandarin"),
//     ListItem(6, "Hindi"),
//     ListItem(7, "Russian"),
//     ListItem(8, "Arabic"),
//     ListItem(9, "Afrikaans"),
//     ListItem(10, "Bengali"),
//     ListItem(11, "Cantonese"),
//     ListItem(12, "Czech"),
//     ListItem(13, "Danish"),
//     ListItem(14, "Dutch"),
//     ListItem(15, "Farsi"),
//     ListItem(16, "Filipino"),
//     ListItem(17, "Finnish"),
//     ListItem(18, "German"),
//     ListItem(19, "Greek"),
//     ListItem(20, "Hawaiian"),
//     ListItem(21, "Hebrew"),
//     ListItem(22, "Hungarian"),
//     ListItem(23, "Indonesian"),
//     ListItem(24, "Italian"),
//     ListItem(25, "Japanese"),
//     ListItem(26, "Korean"),
//     ListItem(27, "Malay"),
//     ListItem(28, "Marathi"),
//     ListItem(29, "Polish"),
//     ListItem(30, "Portuguese"),
//     ListItem(31, "Punjabi"),
//     ListItem(32, "Romanian"),
//     ListItem(33, "Swahili"),
//     ListItem(34, "Swedish"),
//     ListItem(35, "Tagalog"),
//     ListItem(36, "Thai"),
//     ListItem(37, "Turkish"),
//     ListItem(38, "Ukrainian"),
//     ListItem(39, "Vietnamese"),
//   ];
//
//   List<ListItem> _proficiencyDropdownItems = [
//     ListItem(1, "Please select your fluency"),
//     ListItem(2, "Basic"),
//     ListItem(3, "Conversational"),
//     ListItem(4, "Fluent"),
//     ListItem(5, "Native/Bilingual"),
//   ];
//
//   List<ListItem> _proficiencyCommentItems = [
//     ListItem(1, "Please choose a language and indicate your fluency."),
//     ListItem(2, "I write in the language decently"),
//     ListItem(3, "I write and speak this language well"),
//     ListItem(4, "I write and speak this language almost perfectly"),
//     ListItem(5,
//         "I write and speak this language perfectly, including colloquialisms"),
//   ];
//
//   // endregion
//
//   // region creates subject list 'List<String> subjects'
//   List<String> subjects = [
//     "Math",
//     "Science",
//     "Geography",
//     "History",
//     "Flutter",
//     "MongoDB",
//     "Dart",
//     "Github",
//     "Express JS",
//     "Social Science",
//     "Algebra",
//     "Calculus",
//     "Trigonometry",
//     "Physics",
//     "Art",
//     "Statistics",
//     "Computer Science",
//     "Computer Programming",
//     "Biology",
//     "Chemistry",
//     "Engineering",
//     "Accounting",
//     "Business",
//     "Law",
//     "Kinesiology",
//     "Medicine",
//     "Animation",
//     "3d Programming",
//     "Early Childhood Education",
//     "Psychology",
//     "Psychiatry",
//     "Electrical Engineering",
//     "Marketing",
//     "Human Resources",
//     "Pharmacy",
//     "Policing",
//     "Project Management",
//   ];
//
//   // endregion creates subject list
//
//   // region variable declarations
//   List<DropdownMenuItem<ListItem>> _languageDropdownMenuItems;
//   List<DropdownMenuItem<ListItem>> _proficiencyDropdownMenuItems;
//   ListItem _selectedLanguageItem;
//   ListItem _selectedProficiencyItem;
//   String proficiencyComment = "";
//   bool showAddButton = false;
//   bool showProficiencyDropdown = false;
//   bool noLanguage = true;
//
//   bool disableProficiency = true;
//   String langNoFluency = "Please indicate your fluency.";
//   TutorProfile profile;
//
//   // #endregion
//   void initState() {
//     super.initState();
//     _languageDropdownMenuItems = buildDropDownMenuItems(_languageDropdownItems);
//     _selectedLanguageItem = _languageDropdownMenuItems[0].value;
//     _proficiencyDropdownMenuItems =
//         buildDropDownMenuItems(_proficiencyDropdownItems);
//     _selectedProficiencyItem = _proficiencyDropdownMenuItems[0].value;
//     if (tutorProfile.languages == null)
//       tutorProfile.languages = new List<String>();
//     profile = new TutorProfile();
//   }
//
//   Color color = Colors.blueGrey;
//
//   SizedBox buildKnownLanguagesListView() {
//     return SizedBox(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         physics: ScrollPhysics(),
//         itemCount: tutorProfile.languages.length,
//         itemBuilder: (context, index) {
//           return buildLanguageCard(index);
//         },
//       ),
//     );
//   }
//
//   void checkIfProficiencyListShouldBeShown() {
//     if (_selectedLanguageItem.value != 1) {
//       showProficiencyDropdown = true;
//     } else {
//       showProficiencyDropdown = false;
//       proficiencyComment = _proficiencyCommentItems[0].text;
//     }
//   }
//
//   Card buildLanguageCard(int index) {
//     return Card(
//         child: ListTile(
//             // child: Padding(
//             //   padding: const EdgeInsets.all(16.0),
//             trailing: Icon(Icons.highlight_remove),
//             subtitle: Text(tutorProfile.languageProficiency[index]),
//             // <-- subtitle //TODO: mark for future use
//             title: Text(
//               tutorProfile.languages[index],
//               style: TextStyle(fontSize: 22.0),
//             ),
//             onLongPress: () {
//               tutorProfile.languages.removeAt(index);
//               tutorProfile.languageProficiency.removeAt(index);
//               setState(() {});
//             }));
//   }
//
// // MARK: Methods / Prefabs
//   List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
//     List<DropdownMenuItem<ListItem>> items = List();
//     for (ListItem listItem in listItems) {
//       items.add(
//         DropdownMenuItem(
//           child: Text(listItem.text),
//           value: listItem,
//         ),
//       );
//     }
//     return items;
//   }
//
//   RaisedButton buildAddButton() {
//     return RaisedButton(
//       color: Colors.blue,
//       child: Text(
//         "Add Language",
//         style: TextStyle(color: Colors.white, fontSize: 18),
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       padding: EdgeInsets.all(20),
//       onPressed: () {
//         // if the language is not in the list, add it and it's fluency
//         if (!tutorProfile.languages.contains(_selectedLanguageItem.text)) {
//           tutorProfile.languages.add(_selectedLanguageItem.text);
//           tutorProfile.languageProficiency.add(_selectedProficiencyItem.text);
//         } else // Language is in list already
//         {
//           // look through the list of languages
//           for (int i = 0; i < tutorProfile.languages.length; i++) {
//             // find the language in question
//             if (tutorProfile.languages[i] == _selectedLanguageItem.text) {
//               // Check the list of languages to see if language has correct fluency
//               if (tutorProfile.languageProficiency[i] !=
//                   _selectedProficiencyItem.text) {
//                 // if the selected fluency is not the current fluency for that language, update it
//                 tutorProfile.languageProficiency[i] =
//                     _selectedProficiencyItem.text;
//               }
//             }
//           }
//           // TODO: Remove the below block (print of languages for testing
//           print(">>>> Languages:");
//           for (int i = 0; i < tutorProfile.languages.length; i++) {
//             print(tutorProfile.languages[i]);
//             print("    " + tutorProfile.languageProficiency[i]);
//           }
//         }
//         setState(() {}); // Updates list of language cards
//       },
//     );
//   }
//
//   DropdownButton<ListItem> buildProficiencyDropdown() {
//     return DropdownButton<ListItem>(
//         value: _selectedProficiencyItem,
//         items: _proficiencyDropdownMenuItems,
//         disabledHint: Text("How well do you speak this language?"),
//         onChanged: (value) {
//           _selectedProficiencyItem = value;
//           setState(() {
//             controlAddLanguageButtonVisibility();
//           });
//           for (ListItem comment in _proficiencyCommentItems) {
//             if (comment.value == _selectedProficiencyItem.value) {
//               proficiencyComment = comment.text;
//             }
//           }
//         });
//   }
//
//   void controlAddLanguageButtonVisibility() {
//     if (_selectedLanguageItem.value == 1 ||
//         _selectedProficiencyItem.value == 1) {
//       showAddButton = false;
//     } else {
//       showAddButton = true;
//     }
//   }
//
// // #endregion
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Create a Tutor Profile')),
//         ),
//         body: ListView(children: [
//           SizedBox(height: 10),
//           ListTile(
//             title: Text("Add your location: "),
//           ),
//           //TODO: Get name from userID
//           TextFormField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'City',
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'State / Province',
//             ),
//           ),
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("Give your profile a headline: "),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Profile Headline',
//             ),
//           ),
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("Tell us about yourself: "),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             minLines: 8,
//             maxLines: 16,
//             maxLength: 240,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText:
//                   'Tell students how you can help them learn', //TODO: Populate with existing profile message
//             ),
//           ),
//           SizedBox(height: 30),
//           ListTile(
//             title: Text(
//                 "What is the highest level of student you would like to tutor?"),
//           ),
//           SizedBox(height: 10),
//           // TODO: Add dropDown for skillLevel
//
//           GestureDetector(
//             child: Card(
//               child: ListTile(
//                 title: Center(
//                     child: Text(tutorProfile.skillLevel + ' level tutor')),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           CreateTutor1LevelPage(tutorProfile: tutorProfile)));
//               setState(() {
//                 /// TODO: add code in  setState to enable/disable tapping to edit if Tutor is viewing own profile
//               });
//             },
//           ),
//           // Tutoring Skill Level Input
//
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("What are some subjects you would like to tutor?"),
//           ),
//           SizedBox(height: 10),
//
//           Container(
//             child: Column(
//               children: [
//                 for (var sub in tutorProfile.tutoredSubjects) Text(sub),
//               ],
//             ),
//           ),
//           SizedBox(height: 15),
//           SizedBox(
//             //flex: 4,
//             height: 200,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10),
//                     SizedBox(
//                       child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         physics: ScrollPhysics(),
//                         itemCount: subjects.length,
//                         itemBuilder: (context, index) {
//                           return Card(
//                               child: ListTile(
//                             //tileColor: color,
//                             title: Text(
//                               subjects[index],
//                               style: TextStyle(fontSize: 22.0),
//                             ),
//                             subtitle: Text('Tap to add/remove a subject'),
//                             // <-- subtitle //TODO: mark for future use
//                             //trailing: Icon(Icons.group_add_outlined, color: color,),
//                             onTap: () {
//                               setState(() {
//                                 tutorProfile.tutoredSubjects =
//                                     tutorProfile.tutoredSubjects;
//                                 color = Colors.red;
//                               });
//
//                               // Create Subject List if Null
//                               if (profile.tutoredSubjects == null) {
//                                 // The list of subjects is null
//                                 profile.tutoredSubjects =
//                                     new List<String>();
//                                 // TODO: onTap Change Icon/card to indicate selected
//
//                               }
//
//                               // List is not null
//                               if (profile.tutoredSubjects.isNotEmpty) {
//                                 if (profile.tutoredSubjects
//                                     .contains(subjects[index])) {
//                                   // The list of subjects already contains this subject
//                                   profile.tutoredSubjects.remove(subjects[
//                                       index]); //remove this subject from subjects
//                                 } else {
//                                   // The list of subjects is not empty, but does not contain this subject
//                                   profile.tutoredSubjects.add(subjects[
//                                       index]); //TODO: Update Icons for selected courses
//                                 }
//                               } else {
//                                 // The list of subjects is Empty
//                                 profile.tutoredSubjects
//                                     .add(subjects[index]);
//                               }
//                               for (int i = 0;
//                                   i < profile.tutoredSubjects.length;
//                                   i++) {
//                                 print(profile.tutoredSubjects
//                                     .elementAt(i)
//                                     .toString());
//                               }
//                             },
//                             //),
//                           ));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("How much experience do you have as a tutor?"),
//           ),
//           SizedBox(height: 10),
//
//           // TODO: Add dropDown for experience
//           Card(
//             child: ListTile(
//               title: Center(
//                 child: Text('Subject expertise: ' +
//                     tutorProfile.tutorExpertise +
//                     ' level'),
//               ),
//             ),
//           ),
//
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("What language(s) do you speak?"),
//           ),
//           ListTile(
//             title: Text("Add languages:"),
//           ),
//           SizedBox(height: 10),
//           Column(
//             children: [
//               SizedBox(height: 10),
//               DropdownButton<ListItem>(
//                 value: _selectedLanguageItem,
//                 items: _languageDropdownMenuItems,
//                 onChanged: (value) {
//                   _selectedLanguageItem = value;
//                   _selectedProficiencyItem = _proficiencyDropdownMenuItems[0]
//                       .value; // resets the fluency level when the language is changed
//                   setState(() {
//                     controlAddLanguageButtonVisibility();
//                   });
//                   checkIfProficiencyListShouldBeShown();
//                 },
//                 hint: Text("Select"),
//               ),
//               SizedBox(height: 10),
//               if (showProficiencyDropdown) buildProficiencyDropdown(),
//               SizedBox(height: 10),
//               Text(proficiencyComment),
//               SizedBox(height: 10),
//               if (showAddButton) buildAddButton(),
//               SizedBox(height: 10),
//               if (noLanguage)
//                 Text(
//                     "Please press add Language to add languages or press on a language to remove it."),
//               SizedBox(height: 10),
//               buildKnownLanguagesListView(),
//               SizedBox(height: 10),
//             ],
//           ),
//           SizedBox(height: 30),
//           ListTile(
//             title: Text("What is your desired hourly rate?"),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Hourly Rate',
//             ),
//           ),
//           SizedBox(height: 30),
//           SizedBox(
//             width: 250,
//             height: 50,
//             child: RaisedButton(
//                 child: Text(
//                   "Edit Profile",
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 onPressed:
//                     null), //TODO: Change color of button and text to -> "tap field to edit", and enable GestureDetectors
//           ),
//         ]),
//       ),
//     );
//   }
// }
