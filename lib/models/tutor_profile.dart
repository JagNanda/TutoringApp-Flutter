import 'package:tutoring_app_flutter/models/education_history.dart';

class TutorProfile {
  String tutorId;
  String skillLevel;
  List<String> tutoredSubjects = [];
  String tutorExpertise;

  //Education
  List<EducationHistory> education = [];

  // Languages

  List<String> languages = [];
  List<String> languageProficiency = [];

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
  bool isCompleted;

  TutorProfile({
    this.tutorId,
    this.skillLevel = "high",
    this.tutoredSubjects,
    this.tutorExpertise = "",
    this.education,
    this.languages,
    this.languageProficiency,
    this.hourlyRate = "",
    this.profileHeadline = "",
    this.profileOverview = "",
    this.profilePicImgUrl,
    this.tutorCountry = "",
    this.tutorStreetAdd = "",
    this.tutorCity = "",
    this.tutorProvinceState = "",
    this.tutorPostal = "",
    this.phone = "",
    this.isCompleted,
  });
}
