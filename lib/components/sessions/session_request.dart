import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionRequest extends StatefulWidget {
  @override
  _SessionRequestState createState() => _SessionRequestState();
}

class _SessionRequestState extends State<SessionRequest> {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      //drawer: new DrawerCodeOnly(), // line needed to have Drawer menu on each page, not needed as back button is more appropriate on this page
      appBar: new AppBar(
        title: new Text("Session Request"),
      ),
      body: new Text("This is the Session Request page"),
    );
  }
}