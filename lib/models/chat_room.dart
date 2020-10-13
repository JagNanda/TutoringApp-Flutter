import 'package:flutter/material.dart';
import './message.dart';

class ChatRoom {
  String tuteeId;
  String tutorId;
  List<Message> messages;
  DateTime dateTime;

  ChatRoom({this.tuteeId, this.tutorId, this.messages, this.dateTime});

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    var messages = json['messages'] as List;
    List<Message> messageList = [];
    print(messages.runtimeType);
    if(messages.length != 0) {
      messageList = messages.map((i) => Message.fromJson(i)).toList();
    }

    return new ChatRoom(
      tuteeId: json['tuteeId'],
      tutorId: json['tutorId'],
      messages: messageList,
      dateTime: DateTime.parse(json['date'])
    );
  }
}