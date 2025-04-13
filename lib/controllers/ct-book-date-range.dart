import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDateRangeController extends GetxController {
  final Rx<DateTimeRange?> _selectedDateRange = Rx<DateTimeRange?>(null);

  DateTimeRange? get dateRange => _selectedDateRange.value;

  void clearDateRange() => _selectedDateRange.value = null;

  void setDateRange(DateTimeRange? selectedRange) {
    _selectedDateRange.value = selectedRange;
  }
}
