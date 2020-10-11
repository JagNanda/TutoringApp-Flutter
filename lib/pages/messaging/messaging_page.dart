import 'package:flutter/material.dart';

import '../../components/messaging/chat_room_list.dart';
import '../../models/chat_room.dart';
import '../../models/message.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {

  final List<ChatRoom> _chatRooms = [
    ChatRoom(
        id: 'cr1',
        imgUrl: 'https://via.placeholder.com/50',
        lastMessage: 'This is a last message, I\'ll make it longer.',
        name: 'Ryan Haire',
        messages: [
          Message(
              id: 'msg1',
              name: 'Ryan Haire',
              imgUrl: 'https://via.placeholder.com/50',
              body: 'This is a message.',
              dateTime: DateTime.now()
          ),
          Message(
              id: 'msg2',
              name: 'John Smith',
              imgUrl: 'https://via.placeholder.com/50',
              body: 'Reply with a message',
              dateTime: DateTime.now()
          ),
          Message(
              id: 'msg3',
              name: 'Ryan Haire',
              imgUrl: 'https://via.placeholder.com/50',
              body: 'How you doing?',
              dateTime: DateTime.now()
          ),
          Message(
              id: 'msg4',
              name: 'John Smith',
              imgUrl: 'https://via.placeholder.com/50',
              body: 'Good, how you doing?',
              dateTime: DateTime.now()
          ),
        ]
    ),
    ChatRoom(
        id: 'cr2',
        imgUrl: 'https://via.placeholder.com/50',
        lastMessage: 'I would like to talk about a session.',
        name: 'Tony Stark'
    ),
    ChatRoom(
        id: 'cr3',
        imgUrl: 'https://via.placeholder.com/50',
        lastMessage: 'Another message.',
        name: 'John Smith'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatRoomList(_chatRooms));
  }
}