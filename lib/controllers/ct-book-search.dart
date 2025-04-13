import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/dummy/dd-cars.dart';
import '../models/md-car-infornation.dart';

class BookSearchController extends GetxController {
  final Rx<List<CarInformation>?> _query = Rx<List<CarInformation>?>(null);
  List<CarInformation>? get query => _query.value;

  final TextEditingController textController = TextEditingController();

  void setSearchQuery(String queryValue) {
    if (queryValue.isNotEmpty) {
      _query.value = carList
          .where((car) =>
              car.name.toLowerCase().contains(queryValue.toLowerCase()))
          .toList();
    } else {
      _query.value = null;
    }
  }
}
