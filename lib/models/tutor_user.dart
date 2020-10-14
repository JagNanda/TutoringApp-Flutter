
class TutorUser {
  String userId;
  String tutorId;
  String firstName;
  String lastName;
  bool isTutor;
  bool isVerified;
  bool isAdmin;

  TutorUser({ this.userId, this.tutorId, this.firstName, this.lastName, this.isTutor, this.isVerified, this.isAdmin});

  factory TutorUser.fromJson(Map<String, dynamic> json) {
    var userInfo = json['userInfo'];
    return new TutorUser(
        userId: userInfo['_id'],
        tutorId: json['tutorId'],
        firstName: userInfo['firstName'],
        lastName: userInfo['lastName'],
        isTutor: userInfo['isTutor'] as bool,
        isVerified: userInfo['isVerified'] as bool,
        isAdmin: userInfo['isAdmin'] as bool
    );
  }
}