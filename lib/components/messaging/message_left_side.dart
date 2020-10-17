import 'package:flutter/material.dart';

class MessageLeftSide extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String body;
  final DateTime dateTime;

  MessageLeftSide({this.imgUrl, this.name, this.body, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(imgUrl)
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  child: Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                Container(
                    margin: EdgeInsets.all(3),
                    child:Text(body)
                )
              ],
            )
          ],
        )
    );
  }
}