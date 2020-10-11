import 'package:flutter/material.dart';

import '../../models/Message.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  MessageList(this.messages);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [

          ],
        )
    );
  }
}