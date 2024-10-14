import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:drawable_text/drawable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widget/custom_input_field.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({
    super.key,
    required this.onChangeDate,
    required this.onChangeTime,
    this.firstDate,
    this.lastDate,
    this.initial,
    this.hint,
  });

  final String? hint;
  final DateTime? initial;
  final DateTime? firstDate;
  final DateTime? lastDate;

  final Function(DateTime? d) onChangeDate;
  final Function(DateTime? d) onChangeTime;

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  DateTime time = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
  final dController = TextEditingController();

  final tController = TextEditingController();

  void showTime() async {
    await Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: false,
        cancelText: 'Cancel',
        okText: 'Done',
        value: Time(hour: DateTime.now().hour, minute: DateTime.now().minute),
        onChange: (p0) {
          time = time.copyWith(hour: p0.hour, minute: p0.minute);
        },
      ),
    );

    tController.text = DateFormat('HH:mm').format(time);
    widget.onChangeTime.call(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!(widget.hint == null))
          DrawableText(
            text: (widget.hint ?? ''),
            size: 14.0,
            fontWeight: FontWeight.w500,
            matchParent: true,
            // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0).r,
          ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomInputField(
                controller: dController,
                enable: false,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: widget.initial,
                    firstDate: widget.firstDate ?? DateTime.now(),
                    lastDate: widget.lastDate ?? DateTime(2030),
                  ).then(
                    (pick) {
                      if (pick == null) return;
                      time = time.copyWith(
                          day: pick.day, month: pick.month, year: pick.year);

                      dController.text = time.toString();
                      widget.onChangeDate.call(pick);
                      // showTime();
                    },
                  );
                },
                labelText: 'Date',
                hintText: 'Date',
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: CustomInputField(
                controller: tController,
                enable: false,
                onTap: showTime,
                labelText: 'Time',
                hintText: 'Time',
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
    required this.onChangeDate,
    required this.onChangeTime,
    this.firstDate,
    this.lastDate,
    this.initial,
    this.hint,
  });

  final String? hint;
  final DateTime? initial;
  final DateTime? firstDate;
  final DateTime? lastDate;

  final Function(DateTime? d) onChangeDate;
  final Function(DateTime? d) onChangeTime;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  DateTime time = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
  final dController = TextEditingController();

  final tController = TextEditingController();

  void showTime() async {
    await Navigator.of(context).push(
      showPicker(
        context: context,
        is24HrFormat: false,
        cancelText: 'Cancel',
        okText: 'Done',
        value: Time(hour: DateTime.now().hour, minute: DateTime.now().minute),
        onChange: (p0) {
          time = time.copyWith(hour: p0.hour, minute: p0.minute);
        },
      ),
    );

    tController.text = DateFormat('HH:mm').format(time);
    widget.onChangeTime.call(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!(widget.hint == null))
          DrawableText(
            text: (widget.hint ?? ''),
            size: 14.0,
            fontWeight: FontWeight.w500,
            matchParent: true,
            // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0).r,
          ),
        Row(
          children: [
            Expanded(
              child: CustomInputField(
                controller: tController,
                enable: false,
                onTap: showTime,
                labelText: 'Time',
                hintText: 'Time',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

