class ConfirmCodeRequest {
  ConfirmCodeRequest({
    this.code,
    this.email,
    this.password,
    this.confirmPassword,
    this.firstName,
    this.lastName,
  });

  String? code;
  String? email;
  String? password;
  String? confirmPassword;
  String? firstName;
  String? lastName;

  factory ConfirmCodeRequest.fromJson(Map<String, dynamic> json) {
    return ConfirmCodeRequest(
      code: json["code"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      confirmPassword: json["confirm_password"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "first_name": firstName,
        "last_name": lastName,
      };
}
