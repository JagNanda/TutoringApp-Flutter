
class Message {
  String tutorId;
  String tuteeId;
  String body;
  DateTime dateTime;

  Message({this.tutorId, this.tuteeId, this.body, this.dateTime});

  factory Message.fromJson(Map<String, dynamic> json) {
    return new Message(
      tutorId: json['tutorId'],
      tuteeId: json['tuteeId'],
      body: json['message'],
      dateTime: json['date']
    );
  }

}