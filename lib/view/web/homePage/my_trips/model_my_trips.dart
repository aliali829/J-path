// To parse this JSON data, do
//
//     final adminTrips = adminTripsFromJson(jsonString);

import 'dart:convert';

List<AdminTrip> adminTripsFromJson(String str) =>
    List<AdminTrip>.from(json.decode(str).map((x) => AdminTrip.fromJson(x)));

String adminTripsToJson(List<AdminTrip> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminTrip {
  int id;
  DateTime tripDate;
  String startHour;
  String source;
  String destination;
  String status;
  int companieId;
  DateTime createdAt;
  DateTime updatedAt;

  AdminTrip({
    required this.id,
    required this.tripDate,
    required this.startHour,
    required this.source,
    required this.destination,
    required this.status,
    required this.companieId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminTrip.fromJson(Map<String, dynamic> json) => AdminTrip(
        id: json["id"],
        tripDate: DateTime.parse(json["trip_date"]),
        startHour: json["start_hour"],
        source: json["source"],
        destination: json["destination"],
        status: json["status"],
        companieId: json["companie_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip_date":
            "${tripDate.year.toString().padLeft(4, '0')}-${tripDate.month.toString().padLeft(2, '0')}-${tripDate.day.toString().padLeft(2, '0')}",
        "start_hour": startHour,
        "source": source,
        "destination": destination,
        "status": status,
        "companie_id": companieId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
