// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/controllers/ct-car-information.dart';
import 'package:car_reservation_system/models/md-car-infornation.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CarInformationScreen extends StatelessWidget {
  CarInformationScreen({super.key});
  late Size size;
  CarInformationController carInformationController =
      Get.put(CarInformationController());

  @override
  Widget build(BuildContext context) {
    carInformationController.onReady();

    //
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Information'),
        centerTitle: true,
      ),
      body: Obx(() {
        CarInformation? car = carInformationController.car.value;

        if (car == null) {
          return const Center(
            child: Text('Error loading', style: TextStyle(color: Colors.grey)),
          );
        } else {
          return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(children: [
              ClipRRect(
                child: Image.network(
                  'http://d1hv7ee95zft1i.cloudfront.net/custom/blog-post-photo/gallery/toyota-fortuner-630f315461ab8.jpg',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: size.width * 0.7,
                ),
              ),
              gap(size.width * 0.05),
              Text(
                'Toyota Fortuner',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              gap(size.width * 0.02),
              Text(
                'Php 5,000/day',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              gap(size.width * 0.01),
              Text(
                '(Available)',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                ),
              ),
              gap(size.width * 0.04),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.6, size.width * 0.1),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF884CCE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                  ),
                ),
                child: const Text('Book Now'),
              ),
              const Divider(color: Color(0xFFC7C7C7), thickness: 0.5),
              Card(
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                color: Colors.white,
                shape: const LinearBorder(),
                elevation: 2.0,
                child: ListTile(
                  leading: const Icon(
                    Icons.contact_phone,
                    color: Color(0xFF884CCE),
                  ),
                  title: const Text(
                    'John Doe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('john.doe@example.com'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    color: const Color(0xFF884CCE),
                  ),
                ),
              ),
              const Divider(color: Color(0xFFC7C7C7), thickness: 0.5),
              gap(size.width * 0.04),
              _buildAccordion(
                title: 'Car Information',
                widgetItems: [
                  _buildAccordionItems(
                      title: 'Name: ', value: 'Toyota Fortuner'),
                  gap(8),
                  _buildAccordionItems(
                      title: 'Model: ', value: 'Fortuner 2022'),
                  gap(8),
                  _buildAccordionItems(
                      title: 'Transmission: ', value: 'Automatic'),
                  gap(8),
                  _buildAccordionItems(title: 'Seats: ', value: '4'),
                ],
              ),
              gap(10),
              _buildAccordion(
                title: 'Owner Information',
                widgetItems: [
                  _buildAccordionItems(title: 'Name: ', value: 'John Doe'),
                  gap(8),
                  _buildAccordionItems(
                      title: 'Address: ', value: '123 Main St'),
                  gap(8),
                  _buildAccordionItems(
                      title: 'Contact: ', value: '123-456-7890', isCopy: true),
                  gap(8),
                  _buildAccordionItems(
                      title: 'Email: ',
                      value: 'qgYHd@example.com',
                      isCopy: true),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildAccordion(
      {required String title, required List<Widget> widgetItems}) {
    return CustomAccordion(
      title: title,
      toggleIconOpen: Icons.keyboard_arrow_right_rounded,
      toggleIconClose: Icons.keyboard_arrow_down_rounded,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      headerBackgroundColor: const Color(0xFFD7D7D7),
      backgroundColor: Colors.white,
      showContent: true,
      widgetItemsPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      widgetItems: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgetItems,
      ),
    );
  }

  Widget _buildAccordionItems(
      {required String title, required String value, bool isCopy = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        if (isCopy)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(Get.context!).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard.')),
              );
            },
            child: const Icon(Icons.copy, color: Colors.black54, size: 16),
          ),
      ],
    );
  }
}
