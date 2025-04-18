// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/controllers/ct-available-filtered-car.dart';
import 'package:car_reservation_system/controllers/ct-book-date-range.dart';
import 'package:car_reservation_system/controllers/ct-book-search.dart';
import 'package:car_reservation_system/models/md-car-infornation.dart';
import 'package:car_reservation_system/screens/car/sc-car-information.dart';
import 'package:car_reservation_system/screens/notification/sc-notif.dart';
import 'package:car_reservation_system/utils/date-range-picker.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/navigation.dart';
import 'package:car_reservation_system/utils/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/date-formatter.dart';

class HomeScreen extends StatelessWidget with CustomColors {
  HomeScreen({super.key});

  late Size size;

  BookDateRangeController dateRangeController =
      Get.put(BookDateRangeController());

  BookSearchController searchController = Get.put(BookSearchController());

  AvailableFilteredCarController carController =
      Get.put(AvailableFilteredCarController());

  CarInformationController carInfoController =
      Get.put(CarInformationController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      primary: true,
      appBar: AppBar(
        toolbarHeight: size.width * 0.25,
        title: Text(
          'A Collection of Cars!',
          style: TextStyle(
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: primary_80,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              navigateTo(route: NotificationScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() {
                return _buildSearchFilters(
                    searchController: searchController,
                    rangeController: dateRangeController);
              }),
              gap(size.width * 0.06),
              _buildSectionHeader('Available Cars'),
              gap(size.width * 0.02),
              Obx(() {
                if (carController.carLists.isEmpty) {
                  return const Center(
                      child: Text(
                    'No cars found.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ));
                }

                return Wrap(
                  runSpacing: size.width * 0.02,
                  spacing: size.width * 0.02,
                  children: [
                    ...carController.carLists.map(
                      (car) => _buildCarCard(car: car),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateRangeLabel(
      {required BookDateRangeController dateRangeController}) {
    DateTime start = dateRangeController.dateRange!.start;
    DateTime end = dateRangeController.dateRange!.end;
    String valueRange = '';

    if (start.isAtSameMomentAs(end)) {
      valueRange = formatDate(format: 'MMMM d', date: start);
    } else if (isSameMonth(start, end)) {
      valueRange =
          '${formatDate(format: 'MMMM d', date: start)} - ${formatDate(format: 'd', date: end)}';
    } else {
      valueRange =
          '${formatDate(format: 'MMMM d', date: start)} - ${formatDate(format: 'MMMM d', date: end)}';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: size.width * 0.03,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: primary_80,
            ),
            text: ' Date Range: ',
            children: [
              TextSpan(
                text: valueRange,
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        gap(0, width: size.width * 0.05),
        GestureDetector(
          onTap: () {
            dateRangeController.clearDateRange();

            carController.filterResults(
              queryController: searchController,
              dateRangeController: dateRangeController,
            );
          },
          child: Text(
            'Reset',
            style: TextStyle(
              decorationColor: Colors.red,
              decoration: TextDecoration.underline,
              fontSize: size.width * 0.04,
              fontStyle: FontStyle.italic,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchFilters({
    required BookSearchController searchController,
    required BookDateRangeController rangeController,
  }) {
    return Wrap(
      runSpacing: size.width * 0.02,
      children: [
        Row(
          children: [
            _buildSearchField(
              searchController.textController,
            ),
            gap(0, width: size.width * 0.03),
            _buildDateRangePicker(onPressed: () async {
              var selectedRange = await selectDateRange();
              rangeController.setDateRange(selectedRange);

              carController.filterResults(
                queryController: searchController,
                dateRangeController: rangeController,
              );
            }),
          ],
        ),
        if (rangeController.dateRange != null)
          _dateRangeLabel(dateRangeController: rangeController),
      ],
    );
  }

  Widget _buildSearchField(TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: (value) {
          searchController.setSearchQuery(value);
          carController.filterResults(
            queryController: searchController,
            dateRangeController: dateRangeController,
          );
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintStyle: TextStyle(color: grey),
          hintText: 'Search',
          suffixIcon: Icon(Icons.search, color: grey),
        ),
      ),
    );
  }

  Widget _buildDateRangePicker({Function()? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.calendar_month),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Divider(color: primary_80, thickness: 1),
      ],
    );
  }

  Widget _buildCarCard({required CarInformation car}) {
    return GestureDetector(
      onTap: () {
        carInfoController.setCarByID(car.id);
        navigateTo(route: CarInformationScreen());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: ListTile(
            leading: Image.network(
              car.imageUrl,
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
            ),
            title: Text(
              car.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  car.transmission,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                gap(size.width * 0.02),
                Text(car.rental_price),
                gap(size.width * 0.01),
                Text(
                  car.status,
                  style: const TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isSameMonth(DateTime date1, DateTime date2) {
    return DateFormat('MMMM').format(date1) == DateFormat('MMMM').format(date2);
  }
}
