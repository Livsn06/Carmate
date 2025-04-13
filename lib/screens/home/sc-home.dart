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

class HomeScreen extends StatelessWidget with CustomColors {
  HomeScreen({super.key});

  late Size size;

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
              _buildSearchField(),
              gap(size.width * 0.1),
              _buildSectionHeader('Available Cars'),
              gap(size.width * 0.02),
              _buildCarCard(
                title: 'Toyota Fortuner',
                price: '₱ 5,000/day',
                imageUrl:
                    'http://d1hv7ee95zft1i.cloudfront.net/custom/blog-post-photo/gallery/toyota-fortuner-630f315461ab8.jpg',
              ),
              _buildCarCard(
                title: 'Gallardo GT3',
                price: '₱ 30,000/day',
                imageUrl:
                    'https://static.lambocars.com/wp-content/uploads/2020/12/2013_gallardo_gt3_fl2_2.jpg',
              ),
              _buildCarCard(
                title: 'Mustang Ford',
                price: '₱ 20,000/day',
                imageUrl:
                    'https://www.waynephillisford.com.au/media-files/inventory/38693311-0733-4d4b-90a8-8e21d78f375e/e87cbb7a-47b8-46d9-9b1c-c7ab497ec142/large-image.jpg',
              ),
              _buildCarCard(
                title: 'Chevrolet Camaro',
                price: '₱ 20,000/day',
                imageUrl:
                    'https://www.financialexpress.com/wp-content/uploads/2024/06/Chevrolet_Camaro_SS.jpg?w=620',
              ),
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
