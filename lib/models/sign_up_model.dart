
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

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
    };

   static String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());
   
}
