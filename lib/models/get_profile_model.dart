


class ProfileGetModel {
  ProfileGetModel({
    this.email,
    this.username,
    this.userpro,
    this.experience,
    this.education,
    this.message,
  });

  final String? email;
  final String? username;
  final Userpro? userpro;
  final List<dynamic>? experience;
  final List<dynamic>? education;
  final String? message;

  factory ProfileGetModel.fromJson(Map<String, dynamic> json) =>
      ProfileGetModel(
        email: json["email"],
        username: json["username"],
        userpro: Userpro.fromJson(json["userpro"]),
        experience: List<dynamic>.from(json["experience"].map((x) => x)),
        education: List<dynamic>.from(json["education"].map((x) => x)),
      );
}

class Userpro {
  Userpro({
    this.id,
    this.firstName,
    this.lastName,
    required this.dateOfBirth,
    this.profilePhoto,
    this.cv,
    required this.about,
    this.user,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final DateTime dateOfBirth;
  final String? profilePhoto;
  final String? cv;
  final String about;
  final int? user;

  factory Userpro.fromJson(Map<String, dynamic> json) => Userpro(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        profilePhoto: json["profile_photo"],
        cv: json["cv"],
        about: json["about"],
        user: json["user"],
      );
}
