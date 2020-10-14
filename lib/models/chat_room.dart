import 'package:flutter/material.dart';
import './message.dart';
import './tutee_user.dart';
import './tutor_user.dart';


class ChatRoom {
  String tuteeId;
  String tutorId;
  List<Message> messages;
  DateTime dateTime;
  TutorUser tutorUser;
  TuteeUser tuteeUser;

  ChatRoom({this.tuteeId, this.tutorId, this.messages, this.dateTime, this.tutorUser, this.tuteeUser});

  factory ChatRoom.fromJson(Map<String, dynamic> json, List<dynamic> tutor, List<dynamic> tutee) {
    var messages = json['messages'] as List;
    List<Message> messageList = [];
    if(messages.length != 0) {
      messageList = messages.map((i) => Message.fromJson(i)).toList();
    }
    TutorUser tutorUser2 = TutorUser.fromJson(tutor[0]);
    TuteeUser tuteeUser2 = TuteeUser.fromJson(tutee[0]);

    return new ChatRoom(
      tuteeId: json['tuteeId'],
      tutorId: json['tutorId'],
      messages: messageList,
      dateTime: DateTime.parse(json['date']),
      tutorUser: tutorUser2,
      tuteeUser: tuteeUser2
    );
  }
}