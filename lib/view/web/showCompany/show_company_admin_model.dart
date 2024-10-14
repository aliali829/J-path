// To parse this JSON data, do
//
//     final showCompany = showCompanyFromJson(jsonString);

import 'dart:convert';

List<ShowCompany> showCompanyFromJson(String str) =>
    List<ShowCompany>.from(json.decode(str).map((x) => ShowCompany.fromJson(x)));

String showCompanyToJson(List<ShowCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowCompany {
  ShowCompany({
    required this.id,
    required this.name,
    required this.location,
    required this.descr,
    required this.phone,
    required this.evaluation,
    required this.serviceType,
    required this.status,
  });

  final int id;
  final String name;
  final String location;
  final String descr;
  final String phone;
  final String evaluation;
  final String serviceType;
  final CompanyStatus status;

  factory ShowCompany.fromJson(Map<String, dynamic> json) {
    return ShowCompany(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      location: json["location"] ?? "",
      descr: json["descr"] ?? "",
      phone: json["phone"] ?? "",
      evaluation: json["evaluation"] ?? "",
      serviceType: json["service_type"] ?? "",
      status: CompanyStatus.fromName(json["status"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "descr": descr,
        "phone": phone,
        "evaluation": evaluation,
        "service_type": serviceType,
        "status": status.index,
      };
}

enum CompanyStatus {
  pending,
  active,
  refuse;

  static CompanyStatus fromName(String name) {
    switch (name.toLowerCase()) {
      case 'pending':
        return CompanyStatus.pending;
      case 'active':
        return CompanyStatus.active;
      case 'refuse':
        return CompanyStatus.refuse;
    }
    return CompanyStatus.pending;
  }
}
