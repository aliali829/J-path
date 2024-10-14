// To parse this JSON data, do
//
//     final admincustomers = admincustomersFromJson(jsonString);

import 'dart:convert';

List<Admincustomers> admincustomersFromJson(String str) =>
    List<Admincustomers>.from(
        json.decode(str).map((x) => Admincustomers.fromJson(x)));

String admincustomersToJson(List<Admincustomers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admincustomers {
  int id;
  int numberOfPeople;
  int totalPrice;
  String status;
  int userId;
  int offerId;
  DateTime createdAt;
  DateTime updatedAt;

  Admincustomers({
    required this.id,
    required this.numberOfPeople,
    required this.totalPrice,
    required this.status,
    required this.userId,
    required this.offerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Admincustomers.fromJson(Map<String, dynamic> json) => Admincustomers(
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
