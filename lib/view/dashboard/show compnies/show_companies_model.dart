// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  int? id;
  String? name;
  String? location;
  String? descr;
  String? phone;
  String? evaluation;
  String? serviceType;
  dynamic? image;
  String? status;
  int? adminId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Company({
    this.id,
    this.name,
    this.location,
    this.descr,
    this.phone,
    this.evaluation,
    this.serviceType,
    this.image,
    this.status,
    this.adminId,
    this.createdAt,
    this.updatedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        descr: json["descr"],
        phone: json["phone"],
        evaluation: json["evaluation"],
        serviceType: json["service_type"],
        image: json["image"],
        status: json["status"],
        adminId: json["admin_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "descr": descr,
        "phone": phone,
        "evaluation": evaluation,
        "service_type": serviceType,
        "image": image,
        "status": status,
        "admin_id": adminId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
