import '../models/chat_room.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {

  final authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZjZjZjZjMjFmZmEyMjJjMzA4YWM4YmYiLCJtc2ciOiJTdWNjZXNzZnVsbHkgbG9nZ2VkIGluISIsImlhdCI6MTYwMjUzNDczOCwiZXhwIjoxNjAyODk0NzM4fQ.uN2lzR--YSmxOydZXsx41N12mp-hjG2FEKdTn_lCJB0";

  Map<String, String> get headers => {
    "x-auth-token": authToken
  };

  Future<List<ChatRoom>> fetchChatRooms() async {
    final res = await http.get('http://10.0.2.2:5000/api/chatroom/tutor/5f6d01272587f972a420c72c', headers: headers);

    if(res.statusCode == 200) {
      Map<String, dynamic> list = json.decode(res.body);
      // print("list tutor = " + list['tutor'].runtimeType.toString());
      // print("list[tuteesinfo] = " + list['tuteesInfo'].runtimeType.toString());
      // print(list);
      // print(list['chatRooms']);
      var chatRooms = list['chatRooms'].map<ChatRoom>((model) {
        return ChatRoom.fromJson(model, list['tutor'], list['tuteesInfo'][list['chatRooms'].indexOf(model)]);
      }).toList();

      return chatRooms;
    } else {
      throw Exception('Failed to load chat rooms');
    }
  }
}