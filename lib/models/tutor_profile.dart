import 'package:tutoring_app_flutter/models/education_history.dart';

class TutorProfile {
  String tutorId;
  String skillLevel;
  List<String> tutoredSubjects;
  String tutorExpertise;

  // Languages
  List<String> languages;
  List<String> languageProficiency;

  // Wages
  String hourlyRate;

  // Introduction
  String profileHeadline;
  String profileOverview;

  // Profile Pic
  String profilePicImgUrl;

  // Tutor Location Info
  String tutorCountry;
  String tutorStreetAdd;
  String tutorCity;
  String tutorProvinceState;
  String tutorPostal;

  // Tutor Phone Number
  String phone;

  //validation of completed profile
  bool isEditingProfile;

  TutorProfile({
    this.tutorId,
    this.skillLevel,
    this.tutoredSubjects,
    this.tutorExpertise,
    this.languages,
    this.languageProficiency,
    this.hourlyRate,
    this.profileHeadline,
    this.profileOverview,
    this.profilePicImgUrl,
    this.tutorCountry,
    this.tutorStreetAdd,
    this.tutorCity,
    this.tutorProvinceState,
    this.tutorPostal,
    this.phone,
    this.isEditingProfile,
  });
}
