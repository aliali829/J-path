// To parse this JSON data, do
//
//     final myWallet = myWalletFromJson(jsonString);

import 'dart:convert';

List<MyWallet> myWalletFromJson(String str) =>
    List<MyWallet>.from(json.decode(str).map((x) => MyWallet.fromJson(x)));

String myWalletToJson(List<MyWallet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWallet {
  int id;
  String balance;
  int points;
  String level;
  int amountSpent;
  String walletCode;
  int walletableId;
  String walletableType;
  DateTime createdAt;
  DateTime updatedAt;

  MyWallet({
    required this.id,
    required this.balance,
    required this.points,
    required this.level,
    required this.amountSpent,
    required this.walletCode,
    required this.walletableId,
    required this.walletableType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyWallet.fromJson(Map<String, dynamic> json) => MyWallet(
        id: json["id"],
        balance: json["balance"],
        points: json["points"],
        level: json["level"],
        amountSpent: json["amount_spent"],
        walletCode: json["wallet_code"],
        walletableId: json["walletable_id"],
        walletableType: json["walletable_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "points": points,
        "level": level,
        "amount_spent": amountSpent,
        "wallet_code": walletCode,
        "walletable_id": walletableId,
        "walletable_type": walletableType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
