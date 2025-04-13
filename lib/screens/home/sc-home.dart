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

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        hintStyle: TextStyle(color: grey),
        hintText: 'Search',
        suffixIcon: Icon(Icons.search, color: grey),
      ),
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

  Widget _buildCarCard({
    required String title,
    required String price,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: () => navigateTo(route: CarInformationScreen()),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: ListTile(
            leading: Image.network(
              imageUrl,
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(price),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
