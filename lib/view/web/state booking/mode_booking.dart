// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  int id;
  int numberOfPeople;
  int totalPrice;
  String status;
  int userId;
  int offerId;
  DateTime createdAt;
  DateTime updatedAt;

  Booking({
    required this.id,
    required this.numberOfPeople,
    required this.totalPrice,
    required this.status,
    required this.userId,
    required this.offerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        numberOfPeople: json["number_of_people"],
        totalPrice: json["total_price"],
        status: json["status"],
        userId: json["user_id"],
        offerId: json["offer_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number_of_people": numberOfPeople,
        "total_price": totalPrice,
        "status": status,
        "user_id": userId,
        "offer_id": offerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
