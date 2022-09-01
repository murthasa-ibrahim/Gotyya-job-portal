
import 'dart:convert';

class SignUpModel {
    SignUpModel({
        required this.email,
        required this.username,
        required this.password,
    });

    final String email;
    final String username;
    final String password;

    // factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    //     email: json["email"],
    //     username: json["username"],
    //     password: json["password"],
    //     firstName: json["first_name"],
    // );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
    };

  //  static  SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

   static String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());
}
