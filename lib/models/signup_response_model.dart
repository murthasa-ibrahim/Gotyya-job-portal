

class SignUpResponsModel {
    SignUpResponsModel({
         this.username,
         this.email,
         this.id,
         this.message,
    });

    final String? username;
    final String? email;
    final int? id;
    final String? message;

    factory SignUpResponsModel.fromJson(Map<String, dynamic> json) => SignUpResponsModel(
        username: json["username"],
        email: json["email"],
        id: json["id"],
    );

}
