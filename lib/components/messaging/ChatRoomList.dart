import 'package:flutter/material.dart';

import '../../models/ChatRoom.dart';

class ChatRoomList extends StatelessWidget {
  final List<ChatRoom> chatRooms;

  ChatRoomList(this.chatRooms);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(chatRooms[index].imgUrl)
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chatRooms[index].name),
                      Text(chatRooms[index].lastMessage)
                    ],
                  )
                ],
              )
            );
          },
          itemCount: chatRooms.length,
        )
    );
  }
}