import 'package:flutter/material.dart';

import '../../pages/messaging/chat_room_page.dart';
import '../../models/chat_room.dart';

class ChatRoomList extends StatelessWidget {
  final List<ChatRoom> chatRooms;

  ChatRoomList(this.chatRooms);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return GestureDetector(
                onTap: () {
                  debugPrint(chatRooms[index].messages[0].body);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatRoomPage(messages: chatRooms[index].messages)
                      )
                  );
                },
                child: Card(
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
                )
            );
          },
          itemCount: chatRooms.length,
        )
    );
  }
}