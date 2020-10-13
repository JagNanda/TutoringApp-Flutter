import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../components/messaging/chat_room_list.dart';
import '../../models/chat_room.dart';
import '../../models/message.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  var chatRooms = new List<ChatRoom>();

  final authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjZjZjZjMjFmZmEyMjJjMzA4YWM4YmYiLCJtc2ciOiJTdWNjZXNzZnVsbHkgbG9nZ2VkIGluISIsImlhdCI6MTYwMjUzNDczOCwiZXhwIjoxNjAyODk0NzM4fQ.uN2lzR--YSmxOydZXsx41N12mp-hjG2FEKdTn_lCJB0";
  Map<String, String> get headers => {
    "x-auth-token": authToken
  };

  Future fetchChatRooms() async {
    final res = await http.get('http://10.0.2.2:5000/api/chatroom/tutor/5f6d01272587f972a420c72c', headers: headers);

    if(res.statusCode == 200) {
      Iterable list = json.decode(res.body);
      chatRooms = list.map((model) => ChatRoom.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load chat rooms');
    }
  }

  initState() {
    super.initState();
    fetchChatRooms();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _addMessage(String userId, String chatRoomId, String message) {
    // add message via http request to chatroom by userId(tutorId or tuteeId)
    // add message to list of messages in app so message list updates
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatRoomList(chatRooms: chatRooms, addMessage: _addMessage));
  }
}