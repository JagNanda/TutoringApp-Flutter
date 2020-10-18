import 'package:flutter/material.dart';
//import 'package:tutoring_app_flutter/pages/DrawerMenu.dart';

class SessionDetails extends StatefulWidget {
  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      //drawer: new DrawerCodeOnly(), // line needed to have Drawer menu on each page, not needed as back button is more appropriate
      appBar: new AppBar(
        title: new Text("Session Details"),
      ),
      body: new Text("This is the Session Details page"),
    );
  }
}