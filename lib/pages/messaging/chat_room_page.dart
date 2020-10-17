import 'package:flutter/material.dart';

import '../../components/messaging/message_list.dart';
import '../../models/message.dart';

class ChatRoomPage extends StatefulWidget {
  final List<Message> messages;
  final Function addMessage;

  ChatRoomPage({this.messages, this.addMessage});
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final messageController = TextEditingController();

  void submitMessage() {
    // use addMessage function and pass user id(tutorId or tuteeId),
    // chat room id, and message text
    widget.addMessage('userId', 'chatRoomId' , messageController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          MessageList(widget.messages, widget.messages[0].tutorId),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                    hintText: 'Send a message...',
                    border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: submitMessage,
                    icon: Icon(Icons.send)
                  )
                ),
            ),
          ),
        ],
      )
    );
  }
}