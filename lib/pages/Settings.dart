import 'package:flutter/material.dart';
import 'DrawerMenu.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      drawer: new DrawerCodeOnly(), // line needed to have Drawer menu on each page
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: new Text("This is the settings page"),
    );
  }
}