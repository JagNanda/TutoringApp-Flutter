import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/main.dart';
import 'package:tutoring_app_flutter/pages/Sessions/session_dashboard.dart';
import 'package:tutoring_app_flutter/pages/tutor/tutor_dashboard/tutor_dashboard.dart';
import 'login_page.dart';
import 'TestPage.dart';
import 'Settings.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
        title: new Text("Drawer Menu"),
      ),
      body: new Text("Test"),
    );
  }
}

class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(children: <Widget>[
      new UserAccountsDrawerHeader(
          accountName: new Text("Brandon Sarmany",
              style: TextStyle(
                color: Colors.white,
              )),
          accountEmail: new Text("test@hotmail.com", style: TextStyle(color: Colors.white)),
          currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://www.androidcentral.com/sites/androidcentral.com/files/styles/large/public/article_images/2020/09/among_us_google_play_icon.jpg"))),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://www.sheridancollege.ca/-/media/images/www/campuses/trafalgar/trafalgar-road-campus-sheridan-college_2.ashx?mw=767&hash=8FEB6E0B778B6D8CB017C9B7E58DCCE0131D7847")))),
      new ListTile(
        title: new Text("Home Page"),
        trailing: new Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => new TutorDashboard()));
        },
      ),
      new ListTile(
        title: new Text("Profile"),
        trailing: new Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new TestPage()));
        },
      ),
      new ListTile(
        title: new Text("Settings"),
        trailing: new Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Settings()));
        },
      ),
      new ListTile(
        title: new Text("TEMP session"),
        trailing: new Icon(Icons.settings),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => new SessionDashboard()));
        },
      ),
      Container(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: new Text("Logout"),
                    trailing: new Icon(Icons.cancel),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, new MaterialPageRoute(builder: (context) => new LoginPage()));
                    },
                  ),
                ],
              )))),
      new ListTile(
        title: new Text("Close"),
        trailing: new Icon(Icons.cancel),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ]));
  }
}
