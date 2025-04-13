import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTimeRange?> selectDateRange() async {
  var value = await showDateRangePicker(
    context: Get.context!,
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(
      const Duration(days: 365),
    ),
  );

  return value;
}
