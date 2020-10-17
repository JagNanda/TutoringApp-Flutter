
class TuteeUser {
  String userId;
  String tuteeId;
  String firstName;
  String lastName;
  bool isTutor;
  bool isVerified;
  bool isAdmin;

  TuteeUser({ this.userId, this.tuteeId, this.firstName, this.lastName, this.isTutor, this.isVerified, this.isAdmin});

  factory TuteeUser.fromJson(Map<String, dynamic> json) {
    var userInfo = json['userInfo'];

    return new TuteeUser(
      userId: userInfo['_id'],
      tuteeId: json['tuteeId'],
      firstName: userInfo['firstName'],
      lastName: userInfo['lastName'],
      isTutor: userInfo['isTutor'] as bool,
      isVerified: userInfo['isVerified'] as bool,
      isAdmin: userInfo['isAdmin'] as bool
    );
  }
}