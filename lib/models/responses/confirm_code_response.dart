class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });

  final String accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json["accessToken"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}
