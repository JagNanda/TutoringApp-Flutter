import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/models/tutor_profile.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_profile/all_create_tutor_pages.dart';
import 'ListItem.dart';

class CreateTutor5LanguagesPage extends StatefulWidget {
  final TutorProfile profile;

  const CreateTutor5LanguagesPage({
    Key key,
    @required this.profile,
  }) : super(key: key);

  @override
  _CreateTutor5LanguagesPageState createState() =>
      _CreateTutor5LanguagesPageState();
}

class _CreateTutor5LanguagesPageState extends State<CreateTutor5LanguagesPage> {
  // region ListItems
  List<ListItem> _languageDropdownItems = [
    ListItem(1, "Please select a language"),
    ListItem(2, "English"),
    ListItem(3, "French"),
    ListItem(4, "Spanish"),
    ListItem(5, "Mandarin"),
    ListItem(6, "Hindi"),
    ListItem(7, "Russian"),
    ListItem(8, "Arabic"),
    ListItem(9, "Afrikaans"),
    ListItem(10, "Bengali"),
    ListItem(11, "Cantonese"),
    ListItem(12, "Czech"),
    ListItem(13, "Danish"),
    ListItem(14, "Dutch"),
    ListItem(15, "Farsi"),
    ListItem(16, "Filipino"),
    ListItem(17, "Finnish"),
    ListItem(18, "German"),
    ListItem(19, "Greek"),
    ListItem(20, "Hawaiian"),
    ListItem(21, "Hebrew"),
    ListItem(22, "Hungarian"),
    ListItem(23, "Indonesian"),
    ListItem(24, "Italian"),
    ListItem(25, "Japanese"),
    ListItem(26, "Korean"),
    ListItem(27, "Malay"),
    ListItem(28, "Marathi"),
    ListItem(29, "Polish"),
    ListItem(30, "Portuguese"),
    ListItem(31, "Punjabi"),
    ListItem(32, "Romanian"),
    ListItem(33, "Swahili"),
    ListItem(34, "Swedish"),
    ListItem(35, "Tagalog"),
    ListItem(36, "Thai"),
    ListItem(37, "Turkish"),
    ListItem(38, "Ukrainian"),
    ListItem(39, "Vietnamese"),
  ];

  List<ListItem> _proficiencyDropdownItems = [
    ListItem(1, "Please select your fluency"),
    ListItem(2, "Basic"),
    ListItem(3, "Conversational"),
    ListItem(4, "Fluent"),
    ListItem(5, "Native/Bilingual"),
  ];

  List<ListItem> _proficiencyCommentItems = [
    ListItem(1, "Please choose a language and indicate your fluency."),
    ListItem(2, "I write in the language decently"),
    ListItem(3, "I write and speak this language well"),
    ListItem(4, "I write and speak this language almost perfectly"),
    ListItem(5,
        "I write and speak this language perfectly, including colloquialisms"),
  ];

  // endregion

  // region variable declarations
  List<DropdownMenuItem<ListItem>> _languageDropdownMenuItems;
  List<DropdownMenuItem<ListItem>> _proficiencyDropdownMenuItems;
  ListItem _selectedLanguageItem;
  ListItem _selectedProficiencyItem;
  String proficiencyComment = "";
  bool showAddButton = false;
  bool showProficiencyDropdown = false;
  bool hasLanguage = false;

  bool disableProficiency = true;
  String langNoFluency = "Please indicate your fluency.";

  // #endregion

  noLanguagesAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("No languages selected"),
            content: Text("Please add at least one language"),
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

  void initState() {
    super.initState();
    _languageDropdownMenuItems = buildDropDownMenuItems(_languageDropdownItems);
    _selectedLanguageItem = _languageDropdownMenuItems[0].value;
    _proficiencyDropdownMenuItems =
        buildDropDownMenuItems(_proficiencyDropdownItems);
    _selectedProficiencyItem = _proficiencyDropdownMenuItems[0].value;
    if (widget.profile.languages == null)
      widget.profile.languages = new List<String>();
    if (widget.profile.languageProficiency == null)
      widget.profile.languageProficiency = new List<String>();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.profile.languages.length < 1) {
      hasLanguage = false;
    } else {
      hasLanguage = true;
    } // If no language has been selected, show prompt

    //Page Build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Add Languages:",
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
                    DropdownButton<ListItem>(
                      value: _selectedLanguageItem,
                      items: _languageDropdownMenuItems,
                      onChanged: (value) {
                        _selectedLanguageItem = value;
                        _selectedProficiencyItem = _proficiencyDropdownMenuItems[0].value; // resets the fluency level when the language is changed
                        setState(() {
                          controlAddLanguageButtonVisibility();
                        });
                        checkIfProficiencyListShouldBeShown();
                      },
                      hint: Text("Select"),
                    ),
                    SizedBox(height: 10),
                    if (showProficiencyDropdown) buildProficiencyDropdown(),
                    SizedBox(height: 10),
                    Text(proficiencyComment),
                    SizedBox(height: 10),
                    if (showAddButton) buildAddButton(),
                    SizedBox(height: 10),
                    if (hasLanguage) Text("press on a language to remove it."),
                    SizedBox(height: 10),
                    if (hasLanguage) buildKnownLanguagesListView(),
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        setState(() {});
                        if (widget.profile.languages.length < 1) {
                          noLanguagesAlertDialog(context);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateTutor9LocationPage(
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

  SizedBox buildKnownLanguagesListView() {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widget.profile.languages.length,
        itemBuilder: (context, index) {
          return buildLanguageCard(index);
        },
      ),
    );
  }

  void checkIfProficiencyListShouldBeShown() {
    if (_selectedLanguageItem.value != 1) {
      showProficiencyDropdown = true;
    } else {
      showProficiencyDropdown = false;
      proficiencyComment = _proficiencyCommentItems[0].text;
    }
  }

  Card buildLanguageCard(int index) {
    return Card(
        child: ListTile(
            // child: Padding(
            //   padding: const EdgeInsets.all(16.0),
            trailing: Icon(Icons.highlight_remove),
            subtitle: Text(widget.profile.languageProficiency[index]),
            title: Text(
              widget.profile.languages[index],
              style: TextStyle(fontSize: 22.0),
            ),
            onLongPress: () {
              widget.profile.languages.removeAt(index);
              widget.profile.languageProficiency.removeAt(index);
              setState(() {});
            }));
  }

  // MARK: Methods / Prefabs
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.text),
          value: listItem,
        ),
      );
    }
    return items;
  }

  RaisedButton buildAddButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "Add Language",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      onPressed: () {
        // if the language is not in the list, add it and it's fluency
        if (!widget.profile.languages.contains(_selectedLanguageItem.text)) {
          widget.profile.languages.add(_selectedLanguageItem.text);
          widget.profile.languageProficiency.add(_selectedProficiencyItem.text);
        }
        else // Language is in list already
        {
          // look through the list of languages
          for (int i = 0; i < widget.profile.languages.length; i++) {
            // find the language in question
            if (widget.profile.languages[i] == _selectedLanguageItem.text) {
              // Check the list of languages to see if language has correct fluency
              if (widget.profile.languageProficiency[i] !=
                  _selectedProficiencyItem.text) {
                // if the selected fluency is not the current fluency for that language, update it
                widget.profile.languageProficiency[i] =
                    _selectedProficiencyItem.text;
              }
            }
          }
        }
        setState(() {}); // Updates list of language cards
      },
    );
  }

  DropdownButton<ListItem> buildProficiencyDropdown() {
    return DropdownButton<ListItem>(
        value: _selectedProficiencyItem,
        items: _proficiencyDropdownMenuItems,
        disabledHint: Text("How well do you speak this language?"),
        onChanged: (value) {
          _selectedProficiencyItem = value;
          setState(() {
            controlAddLanguageButtonVisibility();
          });
          for (ListItem comment in _proficiencyCommentItems) {
            if (comment.value == _selectedProficiencyItem.value) {
              proficiencyComment = comment.text;
            }
          }
        });
  }

  void controlAddLanguageButtonVisibility() {
    if (_selectedLanguageItem.value == 1 ||
        _selectedProficiencyItem.value == 1) {
      showAddButton = false;
    } else {
      showAddButton = true;
    }
  }
}
