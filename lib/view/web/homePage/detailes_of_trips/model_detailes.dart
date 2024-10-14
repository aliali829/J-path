class DetailesOfTripElement {
  DetailesOfTripElement({
    required this.id,
    required this.description,
    required this.stationsStratHoure,
    required this.stationsEndHoure,
    required this.transportation,
    required this.hotel,
    required this.restaurant,
    required this.touristTripId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String description;
  final String stationsStratHoure;
  final String stationsEndHoure;
  final String transportation;
  final String hotel;
  final String restaurant;
  final int touristTripId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DetailesOfTripElement.fromJson(Map<String, dynamic> json) {
    return DetailesOfTripElement(
      id: json["id"] ?? 0,
      description: json["description"] ?? "",
      stationsStratHoure: json["stations_strat_houre"] ?? "",
      stationsEndHoure: json["stations_end_houre"] ?? "",
      transportation: json["transportation"] ?? "",
      hotel: json["hotel"] ?? "",
      restaurant: json["restaurant"] ?? "",
      touristTripId: json["tourist_trip_id"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "stations_strat_houre": stationsStratHoure,
        "stations_end_houre": stationsEndHoure,
        "transportation": transportation,
        "hotel": hotel,
        "restaurant": restaurant,
        "tourist_trip_id": touristTripId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class PurpleDetailesOfTrip {
  PurpleDetailesOfTrip({
    required this.id,
    required this.tripDate,
    required this.startHour,
    required this.source,
    required this.destination,
    required this.status,
    required this.companieId,
    required this.createdAt,
    required this.updatedAt,
    required this.touristTrips,
    required this.tripEndDate,
    required this.endHour,
    required this.tripTime,
    required this.capacity,
    required this.cost,
    required this.offerId,
  });

  final int id;
  final DateTime? tripDate;
  final String startHour;
  final String source;
  final String destination;
  final String status;
  final int companieId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TouristTrips? touristTrips;
  final DateTime? tripEndDate;
  final DateTime? endHour;
  final dynamic tripTime;
  final num capacity;
  final num cost;
  final int offerId;

  factory PurpleDetailesOfTrip.fromJson(Map<String, dynamic> json) {
    return PurpleDetailesOfTrip(
      id: json["id"] ?? 0,
      tripDate: DateTime.tryParse(json["trip_date"] ?? ""),
      startHour: json["start_hour"] ?? "",
      source: json["source"] ?? "",
      destination: json["destination"] ?? "",
      status: json["status"] ?? "",
      companieId: json["companie_id"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      touristTrips: json["tourist_trips"] == null
          ? null
          : TouristTrips.fromJson(json["tourist_trips"]),
      tripEndDate: DateTime.tryParse(json["trip_end_date"] ?? ""),
      endHour: DateTime.tryParse(json["end_hour"] ?? ""),
      tripTime: json["trip_time"],
      capacity: json["capacity"] ?? 0,
      cost: json["cost"] ?? 0,
      offerId: json["offer_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip_date":
            "${tripDate?.year.toString().padLeft(4, '0')}-${tripDate?.month.toString().padLeft(2, '0')}-${tripDate?.day.toString().padLeft(2, '0')}",
        "start_hour": startHour,
        "source": source,
        "destination": destination,
        "status": status,
        "companie_id": companieId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tourist_trips": touristTrips?.toJson(),
        "trip_end_date":
            "${tripEndDate?.year.toString().padLeft(4, '0')}-${tripEndDate?.month.toString().padLeft(2, '0')}-${tripEndDate?.day.toString().padLeft(2, '0')}",
        "end_hour": endHour?.toIso8601String(),
        "trip_time": tripTime,
        "capacity": capacity,
        "cost": cost,
        "offer_id": offerId,
      };
}

class TouristTrips {
  TouristTrips({
    required this.id,
    required this.tripEndDate,
    required this.endHour,
    required this.tripTime,
    required this.capacity,
    required this.cost,
    required this.offerId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final DateTime? tripEndDate;
  final DateTime? endHour;
  final dynamic tripTime;
  final num capacity;
  final num cost;
  final int offerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory TouristTrips.fromJson(Map<String, dynamic> json) {
    return TouristTrips(
      id: json["id"] ?? 0,
      tripEndDate: DateTime.tryParse(json["trip_end_date"] ?? ""),
      endHour: DateTime.tryParse(json["end_hour"] ?? ""),
      tripTime: json["trip_time"],
      capacity: json["capacity"] ?? 0,
      cost: json["cost"] ?? 0,
      offerId: json["offer_id"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "trip_end_date":
            "${tripEndDate?.year.toString().padLeft(4, '0')}-${tripEndDate?.month.toString().padLeft(2, '0')}-${tripEndDate?.day.toString().padLeft(2, '0')}",
        "end_hour": endHour?.toIso8601String(),
        "trip_time": tripTime,
        "capacity": capacity,
        "cost": cost,
        "offer_id": offerId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

/*
[
	{
		"id": 2,
		"trip_date": "2024-05-08",
		"start_hour": "11:23:20",
		"source": "syria",
		"destination": "a54a",
		"status": "pending",
		"companie_id": 9,
		"created_at": "2024-08-13T00:02:20.000000Z",
		"updated_at": "2024-08-13T00:02:20.000000Z",
		"tourist_trips": {
			"id": 2,
			"trip_end_date": "2024-05-10",
			"end_hour": "2024-08-13T14:00:00.000000Z",
			"trip_time": null,
			"capacity": 356,
			"cost": 34567,
			"offer_id": 2,
			"created_at": "2024-08-13T00:02:20.000000Z",
			"updated_at": "2024-08-13T00:02:20.000000Z"
		}
	},
	{
		"id": 2,
		"trip_end_date": "2024-05-10",
		"end_hour": "2024-08-13T14:00:00.000000Z",
		"trip_time": null,
		"capacity": 356,
		"cost": 34567,
		"offer_id": 2,
		"created_at": "2024-08-13T00:02:20.000000Z",
		"updated_at": "2024-08-13T00:02:20.000000Z"
	},
	[
		{
			"id": 3,
			"description": "First Station Description",
			"stations_strat_houre": "12:00:00",
			"stations_end_houre": "13:00:00",
			"transportation": "bus",
			"hotel": "Hotel Name",
			"restaurant": "Restaurant Name",
			"tourist_trip_id": 2,
			"created_at": "2024-08-13T00:02:20.000000Z",
			"updated_at": "2024-08-13T00:02:20.000000Z"
		},
		{
			"id": 4,
			"description": "Second Station Description",
			"stations_strat_houre": "14:00:00",
			"stations_end_houre": "15:00:00",
			"transportation": "train",
			"hotel": null,
			"restaurant": null,
			"tourist_trip_id": 2,
			"created_at": "2024-08-13T00:02:20.000000Z",
			"updated_at": "2024-08-13T00:02:20.000000Z"
		}
	]
]*/
