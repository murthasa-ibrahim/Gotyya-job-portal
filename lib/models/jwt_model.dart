class SignInResponsModel {
  SignInResponsModel({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.scope,
    required this.refreshToken,
  });

  final String? accessToken;
  final int expiresIn;
  final String tokenType;
  final String scope;
  final String refreshToken;

  factory SignInResponsModel.fromJson(Map<String, dynamic> json) => SignInResponsModel(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        tokenType: json["token_type"],
        scope: json["scope"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_in": expiresIn,
        "token_type": tokenType,
        "scope": scope,
        "refresh_token": refreshToken,
      };
}
