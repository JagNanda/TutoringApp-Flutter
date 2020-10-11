import 'package:flutter/material.dart';

import '../../components/messaging/message_list.dart';
import '../../models/message.dart';

class ChatRoomPage extends StatefulWidget {
  final List<Message> messages;

  ChatRoomPage({this.messages});

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            MessageList(widget.messages)
          ],
        )
    );
  }
}