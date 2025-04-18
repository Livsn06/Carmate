import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingListScreen extends StatelessWidget with CustomColors {
  BookingListScreen({super.key});

  Size size = const Size(0, 0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking List'),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;

        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  _buildCarCard(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCarCard() {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02),
          child: ListTile(
            leading: Image.network(
              "https://imgcdn.zigwheels.ph/medium/gallery/exterior/25/717/nissan-nv350-urvan-83012.jpg",
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
            ),
            title: const Text(
              'Honda Civic',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Automatic',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                gap(size.width * 0.02),
                const Text('Rp 1.000.000'),
                gap(size.width * 0.01),
                const Text(
                  'Pending Reservation',
                  style: TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
