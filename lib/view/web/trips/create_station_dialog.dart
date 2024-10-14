import 'package:flutter/cupertino.dart';
import 'package:untitled75/view/web/trips/date_time_widget.dart';

import '../../../getx/controller/create_trip_controller.dart';
import '../../../widget/custom_form_button.dart';
import '../../../widget/custom_input_field.dart';

class CreateStationDialog extends StatefulWidget {
  const CreateStationDialog({super.key, required this.request});

  final CreateTripRequest request;

  @override
  State<CreateStationDialog> createState() => _CreateStationDialogState();
}

class _CreateStationDialogState extends State<CreateStationDialog> {
  @override
  Widget build(BuildContext context) {
    final station = Station.fromJson({});
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          CustomInputField(
            labelText: 'descerp',
            hintText: 'descerp',
            onChanged: (value) {
              station.descerp = value;
            },
          ),
          const SizedBox(height: 30.0),
          TimeWidget(
            hint: 'stationsStratHoure',
            onChangeDate: (d) {},
            onChangeTime: (d) {
              if (d == null) return;
              station.stationsStratHoure = d;
            },
          ),
          TimeWidget(
            hint: 'stationsEndHoure',
            onChangeDate: (d) {},
            onChangeTime: (d) {
              if (d == null) return;
              station.stationsEndHoure = d;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInputField(
            labelText: 'transportation',
            hintText: 'transportation',
            onChanged: (value) {
              station.transportation = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInputField(
            labelText: 'hotel',
            hintText: 'hotel',
            onChanged: (value) {
              station.hotel = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomInputField(
            labelText: 'restaurant',
            hintText: 'restaurant',
            onChanged: (value) {
              station.restaurant = value;
            },
          ),
          const SizedBox(height: 30.0),
          CustomFormButton(
            innerText: 'Add Station',
            onPressed: () {
              widget.request.station.add(station);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
