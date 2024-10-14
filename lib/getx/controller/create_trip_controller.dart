import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled75/services/api_service.dart';
import 'package:untitled75/view/web/homePage/detailes_of_trips/controller_detailes.dart';

import '../../services/service_config.dart';

class CreateTripController extends GetxController {
  var loading = false.obs;

  Future<void> createTripApi(CreateTripRequest request) async {
    final response = await APIService().uploadMultiPart(
      url: (request.id != null && request.id != 0)
          ? ServiceConfig.updateTrip
          : ServiceConfig.createTrip,
      fields: request.toJson(),
      files: request.files,
    );

    if (response.statusCode == 200) {
      Get.offNamed("/MainPage");
      print('__________________donr_+__________');
    } else if (response.statusCode == 422) {
      return printError(info: 'create trip error ${response.statusCode}');
    } else {
      return printError(info: 'create trip error ${response.statusCode}');
    }
  }
}

class CreateTripRequest {
  CreateTripRequest({
    this.id,
    this.tripDate,
    this.source,
    this.destination,
    this.cost,
    this.capacity,
    this.tripEndDate,
  });

  int? id;
  DateTime? tripDate;
  String? source;
  String? destination;
  num? cost;
  num? capacity;
  DateTime? tripEndDate;

  List<Station> station = [];
  List<UploadFile> files = [];

  factory CreateTripRequest.fromJson(Map<String, dynamic> json) {
    return CreateTripRequest(
      id: 0,
      tripDate: DateTime.tryParse(json["trip_date"] ?? ""),
      source: json["source"] ?? "",
      destination: json["destination"] ?? "",
      cost: json["cost"] ?? 0,
      capacity: json["capacity"] ?? 0,
      tripEndDate: DateTime.tryParse(json["trip_end_date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    final body = {
      "id": id,
      "trip_date": tripDate?.formatDate,
      "start_hour": tripDate?.formatTime,
      "source": source,
      "destination": destination,
      "cost": cost,
      "capacity": capacity,
      "trip_end_date": tripEndDate?.formatDate,
      "end_hour": tripEndDate?.formatTime,
      "station": station.map((x) => x.toJson()).toList(),
    };
    return {
      'data': jsonEncode(body),
    };
  }

  factory CreateTripRequest.fromTrip(TripResponse trip) {
    final model = CreateTripRequest.fromJson({});
    final time = DateTime.tryParse(trip.trip.startHour);
    model.id = trip.trip.id;
    model.tripDate =
        trip.trip.tripDate?.copyWith(hour: time?.hour, minute: time?.minute);
    model.source = trip.trip.source;
    model.destination = trip.trip.destination;
    model.cost = trip.trip.touristTrips.cost;
    model.capacity = trip.trip.touristTrips.capacity;
    model.station.addAll(trip.stations.map(
      (e) {
        return Station(
          descerp: e.description,
          hotel: e.hotel,
          restaurant: e.restaurant,
          stationsEndHoure: e.stationsEndHoure,
          stationsStratHoure: e.stationsStratHoure,
          transportation: e.transportation,
        );
      },
    ));
    return model;
  }
}

class Station {
  Station({
    this.descerp,
    this.stationsStratHoure,
    this.stationsEndHoure,
    this.transportation,
    this.hotel,
    this.restaurant,
  });

  String? descerp;
  DateTime? stationsStratHoure;
  DateTime? stationsEndHoure;
  String? transportation;
  String? hotel;
  String? restaurant;

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      descerp: json["descerp"] ?? "",
      stationsStratHoure: DateTime.tryParse(json["stations_strat_houre"] ?? ""),
      stationsEndHoure: DateTime.tryParse(json["stations_end_houre"] ?? ""),
      transportation: json["transportation"] ?? "",
      hotel: json["hotel"] ?? "",
      restaurant: json["restaurant"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "descerp": descerp,
        "stations_strat_houre": stationsStratHoure?.formatTime,
        "stations_end_houre": stationsEndHoure?.formatTime,
        "transportation": transportation,
        "hotel": hotel,
        "restaurant": restaurant,
      };
}

extension DateUtcHelper on DateTime {
  int get hashDate => (day * 61) + (month * 83) + (year * 23);

  DateTime get getUtc => DateTime.utc(year, month, day);

  String get formatDate => DateFormat('yyyy-MM-dd').format(this);

  String get formatDateAther => DateFormat('yyyy/MM/dd HH:MM').format(this);

  String get formatTime => DateFormat('HH:mm').format(this);

  String get formatTimeShow =>
      '${hour == 0 ? '00' : hour}:${minute == 0 ? '00' : minute}';

  String get formatDateTime => '$formatDate $formatTime';

  String get formatDateTime1 {
    return DateFormat('dd MMM yyyy  h:mm a').format(this);
  }

  String get formatDateToRequest => DateFormat('yyyy-MM-dd', 'en').format(this);

  DateTime addFromNow(
      {int? year, int? month, int? day, int? hour, int? minute}) {
    return DateTime(
      this.year + (year ?? 0),
      this.month + (month ?? 0),
      this.day + (day ?? 0),
      this.hour + (hour ?? 0),
      this.minute + (minute ?? 0),
    );
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
