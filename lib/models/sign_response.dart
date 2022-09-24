class SignInResponsModel {
  SignInResponsModel({
     this.accessToken,
     this.refreshToken,
     this.message
  });

  final String? accessToken;
  final String? refreshToken;
  final String? message;

  factory SignInResponsModel.fromJson(Map<String, dynamic> json) => SignInResponsModel(
        accessToken: json["access"],
        refreshToken: json["refresh"],
      );

}
