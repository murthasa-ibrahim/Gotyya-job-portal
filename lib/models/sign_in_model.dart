import 'dart:convert';

class SignInModel {
  SignInModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  String signInModelToJson(SignInModel data) => json.encode(data.toJson());
}
