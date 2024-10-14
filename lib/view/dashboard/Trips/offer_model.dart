import 'dart:convert';

List<Offer> offerFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  int id;
  DateTime tripDate;
  String startHour;
  String source;
  String destination;
  String status;
  dynamic image;
  int companieId;
  DateTime createdAt;
  DateTime updatedAt;

  Offer({
    required this.id,
    required this.tripDate,
    required this.startHour,
    required this.source,
    required this.destination,
    required this.status,
    required this.image,
    required this.companieId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        tripDate: DateTime.parse(json["trip_date"]),
        startHour: json["start_hour"],
        source: json["source"],
        destination: json["destination"],
        status: json["status"],
        image: json["image"],
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
        "image": image,
        "companie_id": companieId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
