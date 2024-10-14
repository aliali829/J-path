import 'dart:io';

import 'package:drawable_text/drawable_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled75/services/api_service.dart';

import '../../../getx/controller/create_trip_controller.dart';
import '../../../services/log_api.dart';
import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';
import '../homePage/detailes_of_trips/controller_detailes.dart';
import '../homePage/homepage.dart';
import '../homePage/my_trips/model_my_trips.dart';
import 'create_station_dialog.dart';
import 'date_time_widget.dart';

class CreateTripTab extends StatefulWidget {
  const CreateTripTab({super.key, this.trip});

  final TripResponse? trip;

  @override
  State<CreateTripTab> createState() => _CreateTripTabState();
}

class _CreateTripTabState extends State<CreateTripTab> {
  late final CreateTripRequest request;

  bool isUpdateMode = false;

  @override
  void initState() {
    if (widget.trip != null) {
      request = CreateTripRequest.fromTrip(widget.trip!);
      isUpdateMode = true;
    } else {
      request = CreateTripRequest.fromJson({});
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Trip"),
        leading: IconButton(
            onPressed: () {
              // Get.back();
              Get.toNamed("/MainPage");
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DateTimeWidget(
              hint: 'trip Date',
              initial: request.tripDate,
              onChangeDate: (DateTime? d) {
                if (d == null) return;
                request.tripDate = d;
              },
              onChangeTime: (DateTime? d) {
                if (d == null) return;

                request.tripDate = request.tripDate?.copyWith(
                  hour: d.hour,
                  minute: d.minute,
                );
              },
            ),
            SizedBox(height: 30.0),
            CustomInputField(
              controller: TextEditingController(text: request.source),
              labelText: 'source',
              hintText: 'source',
              onChanged: (value) {
                request.source = value;
              },
            ),
            SizedBox(height: 30.0),
            CustomInputField(
              controller: TextEditingController(text: request.destination),
              labelText: 'destination',
              hintText: 'destination',
              onChanged: (value) {
                request.destination = value;
              },
            ),
            SizedBox(height: 30.0),
            CustomInputField(
              controller: TextEditingController(text: request.cost.toString()),
              labelText: 'cost',
              hintText: 'cost',
              onChanged: (value) {
                request.cost = num.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 30.0),
            CustomInputField(
              controller:
                  TextEditingController(text: request.capacity.toString()),
              labelText: 'capacity',
              hintText: 'capacity',
              onChanged: (value) {
                request.capacity = num.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 30.0),
            DateTimeWidget(
              hint: 'trip End Date',
              initial: request.tripEndDate,
              onChangeDate: (DateTime? d) {
                if (d == null) return;
                request.tripEndDate = d;
              },
              onChangeTime: (DateTime? d) {
                if (d == null) return;

                request.tripEndDate = request.tripEndDate?.copyWith(
                  hour: d.hour,
                  minute: d.minute,
                );
              },
            ),
            SizedBox(height: 30.0),
            CustomFormButton(
              innerText: 'Add Station +',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 70.0),
                      padding: EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: CreateStationDialog(request: request),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
            SizedBox(
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: request.station.length,
                itemBuilder: (context, i) {
                  final e = request.station[i];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    color: Colors.grey[600],
                    child: Column(
                      children: [
                        DrawableText(text: e.descerp ?? ''),
                        DrawableText(
                            text: e.stationsStratHoure?.formatTime ?? ''),
                        DrawableText(
                            text: e.stationsEndHoure?.formatTime ?? ''),
                        DrawableText(text: e.transportation ?? ''),
                        DrawableText(text: e.hotel ?? ''),
                        DrawableText(text: e.restaurant ?? ''),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.0),
            CustomFormButton(
              innerText: 'Add Images +',
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  final fileBytes = result.files.first.bytes;
                  // Upload file
                  setState(() {
                    request.files.add(
                      UploadFile(
                          fileBytes: fileBytes,
                          nameField: 'photos[${request.files.length}]'),
                    );
                  });
                }
              },
            ),
            SizedBox(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: request.files.length,
                itemBuilder: (context, i) {
                  final e = request.files[i];
                  if (e.fileBytes == null) return SizedBox();
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    color: Colors.grey[600],
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.memory(e.fileBytes!),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.0),
            CustomFormButton(
              innerText: '${isUpdateMode ? 'Update' : 'Create'} Trip',
              onPressed: () {
                createTripController.createTripApi(request);
              },
            ),
            SizedBox(height: 70.0),
          ],
        ),
      ),
    );
  }
}
