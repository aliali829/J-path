class CompanyOfferResponse {
  CompanyOfferResponse({
    required this.data,
  });

  final List<CompanyOffer> data;

  factory CompanyOfferResponse.fromJson(Map<String, dynamic> json) {
    return CompanyOfferResponse(
      data: json["data"] == null
          ? []
          : List<CompanyOffer>.from(
              json["data"]!.map((x) => CompanyOffer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
      };
}

class CompanyOffer {
  CompanyOffer({
    required this.id,
    required this.offerId,
    required this.cost,
    required this.destenation,
    required this.source,
    required this.date,
    required this.departure,
    required this.access,
    required this.numberFullClass,
    required this.numberVipClass,
    required this.numberEconomyClass,
    required this.numberTourismClass,
    required this.descrabtionFullClass,
    required this.descrabtionVipClass,
    required this.descrabtionEconomyClass,
    required this.descrabtionTourismClass,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int offerId;
  final String cost;
  final String destenation;
  final String source;
  final DateTime? date;
  final String departure;
  final String access;
  final String numberFullClass;
  final String numberVipClass;
  final String numberEconomyClass;
  final String numberTourismClass;
  final String descrabtionFullClass;
  final String descrabtionVipClass;
  final String descrabtionEconomyClass;
  final String descrabtionTourismClass;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CompanyOffer.fromJson(Map<String, dynamic> json) {
    return CompanyOffer(
      id: json["id"] ?? 0,
      offerId: json["offer_id"] ?? 0,
      cost: json["cost"] ?? "",
      destenation: json["destenation"] ?? "",
      source: json["source"] ?? "",
      date: DateTime.tryParse(json["date"] ?? ""),
      departure: json["departure"] ?? "",
      access: json["access"] ?? "",
      numberFullClass: json["number_full_class"] ?? "",
      numberVipClass: json["number_vip_class"] ?? "",
      numberEconomyClass: json["number_economy_class"] ?? "",
      numberTourismClass: json["number_tourism_class"] ?? "",
      descrabtionFullClass: json["descrabtion_full_class"] ?? "",
      descrabtionVipClass: json["descrabtion_vip_class"] ?? "",
      descrabtionEconomyClass: json["descrabtion_economy_class"] ?? "",
      descrabtionTourismClass: json["descrabtion_tourism_class"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer_id": offerId,
        "cost": cost,
        "destenation": destenation,
        "source": source,
        "departure": departure,
        "access": access,
        "number_full_class": numberFullClass,
        "number_vip_class": numberVipClass,
        "number_economy_class": numberEconomyClass,
        "number_tourism_class": numberTourismClass,
        "descrabtion_full_class": descrabtionFullClass,
        "descrabtion_vip_class": descrabtionVipClass,
        "descrabtion_economy_class": descrabtionEconomyClass,
        "descrabtion_tourism_class": descrabtionTourismClass,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
