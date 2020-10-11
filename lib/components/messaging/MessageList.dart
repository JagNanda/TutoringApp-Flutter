import 'package:flutter/material.dart';

import '../../models/Message.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;

  MessageList(this.messages);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(messages[index].imgUrl)
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(messages[index].name),
                      Text(messages[index].body)
                    ],
                  )
                ],
              )
            );
          },
          itemCount: messages.length
        )
    );
  }
}