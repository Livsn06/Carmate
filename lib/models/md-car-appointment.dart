import 'package:flutter/material.dart';

class CarAppointmentModel {
  int id;
  int carID;
  DateTimeRange dateRange;

  CarAppointmentModel({
    required this.id,
    required this.carID,
    required this.dateRange,
  });
}
