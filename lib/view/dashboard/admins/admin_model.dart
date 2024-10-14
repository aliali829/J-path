// To parse this JSON data, do
//
//     final admin = adminFromJson(jsonString);

import 'dart:convert';

List<Admin> adminFromJson(String str) =>
    List<Admin>.from(json.decode(str).map((x) => Admin.fromJson(x)));

String adminToJson(List<Admin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admin {
  int id;
  String firstName;
  String lastName;
  String email;
  dynamic phoneNumber;
  dynamic emailVerifiedAt;
  dynamic image;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  Admin({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.emailVerifiedAt,
    required this.image,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        emailVerifiedAt: json["email_verified_at"],
        image: json["image"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "email_verified_at": emailVerifiedAt,
        "image": image,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
