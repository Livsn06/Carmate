import 'package:car_reservation_system/controllers/ct-book-date-range.dart';
import 'package:car_reservation_system/controllers/ct-book-search.dart';
import 'package:car_reservation_system/data/dummy/dd-appointment.dart';
import 'package:car_reservation_system/data/dummy/dd-cars.dart';
import 'package:car_reservation_system/models/md-car-infornation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableFilteredCarController extends GetxController {
  //TODO: Implement AvailableFilteredCarController

  RxList<CarInformation> carLists = RxList<CarInformation>([]);
  @override
  void onReady() {
    // TODO: implement onReady

    carLists.value = carList;
    super.onReady();
  }

  void filterResults(
      {required BookSearchController queryController,
      required BookDateRangeController dateRangeController}) {
    var searchCars = queryController.query;
    var dateRange = dateRangeController.dateRange;

    //

    if (searchCars == null && dateRange != null) {
      carLists.value =
          carList.where((car) => isCarAvailable(car.id, dateRange)).toList();
      return;
    }

    if (searchCars != null && dateRange == null) {
      carLists.value = searchCars;
      return;
    }

    if (searchCars != null && dateRange != null) {
      carLists.value =
          searchCars.where((car) => isCarAvailable(car.id, dateRange)).toList();
      return;
    }

    carLists.value = carList;
  }

  bool isCarAvailable(int carID, DateTimeRange selectedRange) {
    for (final appointment in carAppointments) {
      if (appointment.carID == carID) {
        bool overlaps =
            selectedRange.start.isBefore(appointment.dateRange.end) &&
                selectedRange.end.isAfter(appointment.dateRange.start);
        if (overlaps) return false;
      }
    }
    return true;
  }
}
