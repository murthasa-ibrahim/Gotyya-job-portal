import 'dart:io';

class ProfileModel {
  ProfileModel(
      {this.id,
        this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.profilePhoto,
      this.cv,
      this.about,
      this.message});
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  
  final String? profilePhoto;
  final String? cv;
  final String? about;
  final String? message;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        dateOfBirth: json["date_of_birth"] ?? '',
        profilePhoto: json["profile_photo"] ?? '',
        cv: json["cv"] ?? '',
        about: json["about"] ?? '',
      );

  String getFileName(File file) => file.path.split('/').last;
}
