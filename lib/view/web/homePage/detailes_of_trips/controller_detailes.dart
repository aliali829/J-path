import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled75/services/api_service.dart';
import 'package:untitled75/services/helper_api_service.dart';

class showDetailesController extends GetxController {
  var isLoading = true.obs;

  Future<TripResponse?> getTrip(int id) async {
    final result = await APIService().callApi(
        url: 'api/admin/spec_det_trip_tourist',
        type: ApiType.post,
        body: {'id': id});
    if (result.statusCode == 200) {
      return TripResponse.fromJson(jsonDecode(result.body));
    }
  }
}

class TripResponse {
  TripResponse({
    required this.trip,
    required this.stations,
    required this.images,
  });

  final Trip trip;
  final List<Station> stations;
  final Images images;

  factory TripResponse.fromJson(List json) {
    return TripResponse(
      trip: Trip.fromJson(json.isEmpty ? {} : json[0]),
      stations: json.length <= 2
          ? []
          : List<Station>.from(json[2]!.map((x) => Station.fromJson(x))),
      images: Images.fromJson(json.length <= 3 ? {} : json[3]),
    );
  }
}

class Images {
  Images({
    required this.url,
  });

  final List<String> url;

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      url: json["url"] == null
          ? []
          : List<String>.from(json["url"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url.map((x) => x).toList(),
      };
}

class Station {
  Station({
    required this.id,
    required this.description,
    required this.stationsStratHoure,
    required this.stationsEndHoure,
    required this.transportation,
    required this.hotel,
    required this.restaurant,
    required this.touristTripId,
  });

  final int id;
  final String description;
  final DateTime? stationsStratHoure;
  final DateTime? stationsEndHoure;
  final String transportation;
  final String hotel;
  final String restaurant;
  final int touristTripId;

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json["id"] ?? 0,
      description: json["description"] ?? "",
      stationsStratHoure: DateTime.tryParse(json["stations_strat_houre"] ?? ""),
      stationsEndHoure: DateTime.tryParse(json["stations_end_houre"] ?? ""),
      transportation: json["transportation"] ?? "",
      hotel: json["hotel"] ?? "",
      restaurant: json["restaurant"] ?? "",
      touristTripId: json["tourist_trip_id"] ?? 0,
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
  });

  final int id;
  final DateTime? tripEndDate;
  final DateTime? endHour;
  final dynamic tripTime;
  final num capacity;
  final num cost;
  final int offerId;

  factory TouristTrips.fromJson(Map<String, dynamic> json) {
    return TouristTrips(
      id: json["id"] ?? 0,
      tripEndDate: DateTime.tryParse(json["trip_end_date"] ?? ""),
      endHour: DateTime.tryParse(json["end_hour"] ?? ""),
      tripTime: json["trip_time"],
      capacity: json["capacity"] ?? 0,
      cost: json["cost"] ?? 0,
      offerId: json["offer_id"] ?? 0,
    );
  }
}

class Trip {
  Trip({
    required this.id,
    required this.tripDate,
    required this.startHour,
    required this.source,
    required this.destination,
    required this.status,
    required this.companieId,
    required this.touristTrips,
  });

  final int id;
  final DateTime? tripDate;
  final String startHour;
  final String source;
  final String destination;
  final String status;
  final int companieId;
  final TouristTrips touristTrips;

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json["id"] ?? 0,
      tripDate: DateTime.tryParse(json["trip_date"] ?? ""),
      startHour: json["start_hour"] ?? "",
      source: json["source"] ?? "",
      destination: json["destination"] ?? "",
      status: json["status"] ?? "",
      companieId: json["companie_id"] ?? 0,
      touristTrips: TouristTrips.fromJson(json["tourist_trips"] ?? {}),
    );
  }
}
