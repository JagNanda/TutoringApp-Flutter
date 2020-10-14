import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../components/messaging/message_right_side.dart';
import '../../components/messaging/message_left_side.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final String loggedInUserId;

  MessageList(this.messages, this.loggedInUserId);

  @override
  Widget build(BuildContext context) {
    if(messages.isEmpty) {
      return Center(child: Text('No messages in the chat'));
    }
    return Expanded(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            // check if tutorid or tutee id == logged in user id
            if(messages[index].tutorId == loggedInUserId) {
              return MessageRightSide(
                imgUrl: 'https://via.placeholder.com/50',
                body: messages[index].body,
                name: messages[index].tutorId,
                dateTime: messages[index].dateTime,
              );
            } else if(messages[index].tuteeId == loggedInUserId) {
              return MessageRightSide(
                imgUrl: 'https://via.placeholder.com/50',
                body: messages[index].body,
                name: messages[index].tuteeId,
                dateTime: messages[index].dateTime,
              );
            } else {
              return MessageLeftSide(
                imgUrl: 'https://via.placeholder.com/50',
                body: messages[index].body,
                name: messages[index].tuteeId,
                dateTime: messages[index].dateTime,
              );
            }

          },
          itemCount: messages.length
        )
    );
  }
}