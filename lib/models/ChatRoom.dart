
import './Message.dart';

class ChatRoom {
  String id;
  String imgUrl;
  String name;
  String lastMessage;
  List<Message> messages;

  ChatRoom({this.id, this.imgUrl, this.name, this.lastMessage, this.messages});
}