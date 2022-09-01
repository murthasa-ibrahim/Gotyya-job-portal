
import 'dart:convert';


class SignInModel {
    SignInModel({
        required this.clientId,
        required this.clientSecret,
        required this.grantType,
        required this.username,
        required this.password,
    });

    final String clientId;
    final String clientSecret;
    final String grantType;
    final String username;
    final String password;

    // factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    //     clientId: json["client_id"],
    //     clientSecret: json["client_secret"],
    //     grantType: json["grant_type"],
    //     username: json["username"],
    //     password: json["password"],
    // );

    Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "grant_type": grantType,
        "username": username,
        "password": password,
    };

    // SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

}
