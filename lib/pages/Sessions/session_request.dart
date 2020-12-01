import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutoring_app_flutter/pages/messaging/messaging_page.dart';
import 'package:tutoring_app_flutter/services/tutor_service.dart';
import 'package:tutoring_app_flutter/utils/subjects.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionRequest extends StatefulWidget {
  final String tutorId;
  final String cost;
  final String firstName;
  final String lastName;
  final String initials;

  SessionRequest(
      {@required this.tutorId,
      @required this.cost,
      @required this.firstName,
      @required this.lastName,
      @required this.initials});
  @override
  _SessionRequestState createState() => _SessionRequestState();
}

class _SessionRequestState extends State<SessionRequest> {
  TextEditingController _controller = TextEditingController();

  String formattedDate;
  DateTime _dateTime;
  int cost;
  int calculatedCost;
  String pickedSubject;
  String dropdownValue;
  String details;

  @override
  void initState() {
    super.initState();
    _controller.text = "1";
    formattedDate = "";
    cost = int.parse(widget.cost);
    dropdownValue = "Math";
    pickedSubject = "Math";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: new DrawerCodeOnly(), // line needed to have Drawer menu on each page, not needed as back button is more appropriate on this page
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Session Request With"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  child: Center(
                    child: CircleAvatar(
                      radius: 35,
                      child: Text(
                        widget.initials,
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 35.0,
                  child: Center(
                    child: Text(
                      "${widget.firstName} ${widget.lastName}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.lightBlue,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      _dateTime == null ? "Date: " : "Date: " + formattedDate.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('Pick a date'),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2099))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                  formattedDate = _dateTime.year.toString() +
                      "-" +
                      _dateTime.month.toString() +
                      "-" +
                      _dateTime.day.toString();
                });
              });
            },
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.lightBlue,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      calculatedCost == null
                          ? "Cost: \$" + cost.toString()
                          : "Cost: \$" + calculatedCost.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Container(
                    color: Colors.lightBlue,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Hours: ",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                width: 50,
                child: TextFormField(
                  enabled: false,
                  controller: _controller,
                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 5.0,
                    child: Icon(Icons.arrow_drop_up),
                    onPressed: () {
                      int currentValue = int.parse(_controller.text);
                      setState(() {
                        if (currentValue < 4) currentValue++;
                        _controller.text = (currentValue).toString(); // incrementing value
                        calculatedCost = cost * currentValue;
                      });
                    },
                  ),
                  MaterialButton(
                    minWidth: 5.0,
                    child: Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      int currentValue = int.parse(_controller.text);
                      setState(() {
                        if (currentValue > 1) currentValue--;
                        _controller.text = (currentValue).toString(); // decrementing value
                        calculatedCost = cost * currentValue;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.lightBlue,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Subject: " + pickedSubject,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                pickedSubject = newValue;
              });
            },
            items: subjects.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.lightBlue,
                    padding: EdgeInsets.only(bottom: 20),
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          TextField(
            cursorHeight: 30,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(hintText: "Please enter some details"),
            onChanged: (val) {
              details = val;
            },
          ),
          const SizedBox(height: 30),
          Builder(builder: (BuildContext context) {
            return RaisedButton(
              onPressed: () async {
                bool success = await TutorService().createSessionRequest(
                  date: _dateTime,
                  duration: _controller.text,
                  subject: pickedSubject,
                  details: details,
                  totalCost: calculatedCost,
                  tutorId: widget.tutorId,
                );
                print(success);
                if (success) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Session Request Sent!")));
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Please make sure all fields are filled")));
                }
              },
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
              color: Colors.blue,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Create Session Request', style: TextStyle(fontSize: 20)),
              ),
            );
          })
        ]),
      ),
    );
  }
}
