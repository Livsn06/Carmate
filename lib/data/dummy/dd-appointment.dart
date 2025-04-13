import 'package:flutter/material.dart';

import '../../models/md-car-appointment.dart';

final List<CarAppointmentModel> carAppointments = [
  CarAppointmentModel(
    id: 1,
    carID: 1, // Toyota Fortuner
    dateRange: DateTimeRange(
      start: DateTime(2025, 4, 14),
      end: DateTime(2025, 4, 16),
    ),
  ),
  CarAppointmentModel(
    id: 2,
    carID: 2, // Gallardo GT3
    dateRange: DateTimeRange(
      start: DateTime(2025, 4, 15),
      end: DateTime(2025, 4, 18),
    ),
  ),
  CarAppointmentModel(
    id: 3,
    carID: 3, // Mustang Ford
    dateRange: DateTimeRange(
      start: DateTime(2025, 4, 20),
      end: DateTime(2025, 4, 22),
    ),
  ),
  CarAppointmentModel(
    id: 4,
    carID: 4, // Chevrolet Camaro
    dateRange: DateTimeRange(
      start: DateTime(2025, 4, 13),
      end: DateTime(2025, 4, 14),
    ),
  ),
];
