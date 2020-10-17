import 'package:flutter/material.dart';
import 'DrawerMenu.dart';

class TestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar(
          title: new Text("Test Page"),
      ),
      body: new Text("I am on the test page"),
    );
  }
}