import 'dart:html';

import 'package:drawable_text/drawable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../delete_trip/controller_delete_trip.dart';
import '../my_trips/controller_my_trips.dart';
import 'controller_detailes.dart';

showDetailesController controller = Get.find();
showAdminOffersController controller2 = Get.find();
DeleteTripController controller3 = Get.find();

class TripAdDetailes extends StatefulWidget {
  const TripAdDetailes({super.key, required this.id});

  final int id;

  @override
  State<TripAdDetailes> createState() => _TripAdDetailesState();
}

class _TripAdDetailesState extends State<TripAdDetailes> {
  TripResponse? trip;

  @override
  void initState() {
    controller.getTrip(widget.id).then(
      (value) {
        setState(() => trip = value);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (trip == null) return;
          Get.toNamed("/CreateTripPage", arguments: trip);
        },
        child: Icon(Icons.edit, color: Colors.white),
        backgroundColor: Get.theme.primaryColor,
      ),*/
      appBar: AppBar(
        title: const Text("Detailes"),
      ),
      body: Builder(builder: (context) {
        if (trip == null) return const CircularProgressIndicator();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /* DrawableText(
                text: 'id:  ${trip!.trip.id.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'tripDate:  ${trip!.trip.tripDate.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'startHour:  ${trip!.trip.startHour.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),*/
              DrawableText(
                text: 'source:  ${trip!.trip.source.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'destination:  ${trip!.trip.destination.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              /*DrawableText(
                text: 'status:  ${trip!.trip.status.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'companieId:  ${trip!.trip.companieId.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text:
                    'touristTrips id:  ${trip!.trip.touristTrips.id.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),*/
              /*DrawableText(
                text:
                    'tripEndDate:  ${trip!.trip.touristTrips.tripEndDate.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'endHour:  ${trip!.trip.touristTrips.endHour.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),*/
              /* DrawableText(
                text:
                    'tripTime:  ${trip!.trip.touristTrips.tripTime.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),*/
              DrawableText(
                text:
                    'capacity:  ${trip!.trip.touristTrips.capacity.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: 'cost:  ${trip!.trip.touristTrips.cost.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              /*  DrawableText(
                text: 'offerId:  ${trip!.trip.touristTrips.offerId.toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),
              DrawableText(
                text: ':  ${trip!.trip.touristTrips..toString()}',
                padding: EdgeInsets.symmetric(vertical: 5.0),
                matchParent: true,
              ),*/
              SizedBox(height: 20.0),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: trip!.stations.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final e = trip!.stations[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      color: Colors.grey[600],
                      child: Column(
                        children: [
                          /*DrawableText(
                            text: 'id:  ${e.id.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),*/
                          DrawableText(
                            text: 'description:  ${e.description.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          /*DrawableText(
                            text:
                                'stationsStratHoure:  ${e.stationsStratHoure.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          DrawableText(
                            text:
                                'stationsEndHoure:  ${e.stationsEndHoure.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),*/
                          DrawableText(
                            text:
                                'transportation:  ${e.transportation.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          DrawableText(
                            text: 'hotel:  ${e.hotel.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          DrawableText(
                            text: 'restaurant:  ${e.restaurant.toString()}',
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              /* SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: trip!.images.url.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    final e = trip!.images.url[i];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      color: Colors.grey[600],
                      child: Image.network(
                        e,
                        height: 150,
                        width: 100,
                      ),
                    );
                  },
                ),
              ),*/
              SizedBox(height: 20.0),
            ],
          ),
        );
      }),
    );
  }

  void clickDeleteTrip() async {
    EasyLoading.show(status: "Loading----");
    await controller3.DeleteTripOnClick();
    if (controller3.status) {
      EasyLoading.showSuccess("sucses");
      //Get.offNamed("/SignIn");
      window.location.reload();
      //controller.token = UserInformation.User_Token;
      /*    if (kIsWeb) {
        Get.off(WebScreen());
      } else {
        Get.off(MobileHome());
      }*/
      //Get.off(WebScreen());
    } else {
      EasyLoading.showError(
        // controller.message,
        "error",
        duration: const Duration(seconds: 6),
        dismissOnTap: true,
      );
    }
  }
}
