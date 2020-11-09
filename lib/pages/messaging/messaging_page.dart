import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutoring_app_flutter/utils/HttpService.dart';

import '../../components/messaging/chat_room_list.dart';
import '../../models/chat_room.dart';
import '../../models/message.dart';

class MessagingPage extends StatefulWidget {
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  Future<List<ChatRoom>> _chatRooms;
  HttpService httpService = new HttpService();

  initState() {
    super.initState();
    _chatRooms =
        httpService.fetchChatRooms();
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
    return Scaffold(
        body: ChatRoomList(chatRooms: _chatRooms, addMessage: _addMessage)
    );
  }
}