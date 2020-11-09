import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutoring_app_flutter/pages/messaging/messaging_page.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionRequest extends StatefulWidget {
  @override
  _SessionRequestState createState() => _SessionRequestState();
}

final String name = "Brandon";

class _SessionRequestState extends State<SessionRequest> {
  TextEditingController _controller = TextEditingController();

  String formattedDate;
  DateTime _dateTime;
  int cost;
  int calculatedCost;

  @override
  void initState() {
    super.initState();
    _controller.text = "1";
    formattedDate = "";
    cost = 20;
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
                child: new CircleAvatar(
                    radius: 35,
                    //TODO: get requested profile pic
                    backgroundImage: new NetworkImage(
                        "https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/09/among_us_google_play_icon.jpg")),
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
                      name,
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
                        "Subject: Math",
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
          ),
          const SizedBox(height: 30),
          Builder(builder: (BuildContext context) {
            return RaisedButton(
              onPressed: () {
                /*Navigator.push(context, MaterialPageRoute(builder: (context) => MessagingPage()));*/
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Session Request Sent!")));
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
