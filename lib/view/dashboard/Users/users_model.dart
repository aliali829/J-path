// To parse this JSON data, do
//
//     final customers = customersFromJson(jsonString);

import 'dart:convert';

List<Customers> customersFromJson(String str) =>
    List<Customers>.from(json.decode(str).map((x) => Customers.fromJson(x)));

String customersToJson(List<Customers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customers {
  int id;
  String firstName;
  String lastName;
  String email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  dynamic location;
  dynamic annualIncome;
  dynamic gender;
  dynamic country;
  dynamic image;
  dynamic birth;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Customers({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.phoneNumber,
    required this.location,
    required this.annualIncome,
    required this.gender,
    required this.country,
    required this.image,
    required this.birth,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customers.fromJson(Map<String, dynamic> json) => Customers(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phoneNumber: json["phone_number"],
        location: json["location"],
        annualIncome: json["annual_income"],
        gender: json["gender"],
        country: json["country"],
        image: json["image"],
        birth: json["birth"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone_number": phoneNumber,
        "location": location,
        "annual_income": annualIncome,
        "gender": gender,
        "country": country,
        "image": image,
        "birth": birth,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
