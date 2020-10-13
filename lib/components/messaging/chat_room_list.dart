import 'package:flutter/material.dart';

import '../../pages/messaging/chat_room_page.dart';
import '../../models/chat_room.dart';

class ChatRoomList extends StatelessWidget {
  final List<ChatRoom> chatRooms;
  final Function addMessage;

  ChatRoomList({this.chatRooms, this.addMessage});

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
                          builder: (context) => ChatRoomPage(messages: chatRooms[index].messages, addMessage: addMessage)
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
                                child: Image.network('https://via.placeholder.com/50')
                            )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                                child: Text(
                                  chatRooms[index].tuteeId,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                              child: Text(
                                'hello world',
                                style: TextStyle(),
                              )
                            )

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