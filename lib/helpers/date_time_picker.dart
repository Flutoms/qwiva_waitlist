import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> calendarDatePicker({required BuildContext context}) async {
  DateTime? selectedDateTime;

  if (Platform.isAndroid) {
    selectedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    return selectedDateTime;
  } else {
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        minimumDate: DateTime.now(),
                        initialDateTime: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        onDateTimeChanged: (newDate) =>
                            selectedDateTime = newDate),
                  ),
                  CupertinoButton(
                      child: const Text('OK',
                          style: TextStyle(fontSize: 14, color: Colors.green)),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ));
    return selectedDateTime;
  }
}

Future<DateTime?> calendarTimePicker({required BuildContext context}) async {
  DateTime? selectedTime;
  if (!Platform.isAndroid) {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      selectedTime = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, time.hour, time.minute);
    }

    return selectedTime;
  } else {
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  Expanded(
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (newDate) =>
                              selectedTime = newDate)),
                  CupertinoButton(
                      child: const Text('OK',
                          style: TextStyle(fontSize: 14, color: Colors.green)),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ));

    return selectedTime;
  }
}
