import 'package:flutter/material.dart';

class MessageRightSide extends StatelessWidget {

  final String imgUrl;
  final String name;
  final String body;
  final DateTime dateTime;

  MessageRightSide({this.imgUrl, this.name, this.body, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                child: Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
              Container(
                  margin: EdgeInsets.all(3),
                  child:Text(body, style: TextStyle(color: Colors.white),)
              )
            ],
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(imgUrl)
              )
          ),
        ],
      )
    );
  }
}