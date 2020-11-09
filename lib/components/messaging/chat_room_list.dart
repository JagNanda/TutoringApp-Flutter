import 'package:flutter/material.dart';

import '../../pages/messaging/chat_room_page.dart';
import '../../models/chat_room.dart';

/*
snapshot.data[index].messages.isEmpty
                                      ? "No messages in chat room yet."
                                          : snapshot.data[index].messages[snapshot.data[index].messages.length].body.length > 20
                                      ? snapshot.data[index].messages[snapshot.data[index].messages.length].body.substring(0, 20)
                                          : snapshot.data[index].messages[snapshot.data[index].messages.length].body
 */
class ChatRoomList extends StatelessWidget {
  final Future<List<ChatRoom>> chatRooms;
  final Function addMessage;

  ChatRoomList({this.chatRooms, this.addMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<ChatRoom>>(
          future: chatRooms,
          builder: (context, snapshot) {
            if(snapshot.hasError) print(snapshot.error);

            if(snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.data == null) {
                return Text('no data');
              }
            }
            print(snapshot.data[0].messages);
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                print("index = " + index.toString());
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatRoomPage(
                                      messages: snapshot.data[index].messages,
                                      addMessage: addMessage)
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Text(
                                    snapshot.data[index].tuteeUser.firstName,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 0),
                                    child: Text(
                                      "hello world", // change default message to default
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
            );
          },
        )
    );
  }
}