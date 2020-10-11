import 'package:flutter/material.dart';

import '../../components/messaging/ChatRoomList.dart';
import '../../models/ChatRoom.dart';

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
        name: 'Ryan Haire'
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