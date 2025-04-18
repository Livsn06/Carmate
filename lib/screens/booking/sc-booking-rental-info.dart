import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingInformationScreen extends StatelessWidget with CustomColors {
  const BookingInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Information'),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "Edit",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: TextEditingController(text: 'John Doe'),
                        decoration: const InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder()),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller:
                                  TextEditingController(text: 'john@gmail.com'),
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          gap(0, width: width * 0.02),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller:
                                  TextEditingController(text: '09553245422'),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gap(10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      TextFormField(
                        readOnly: true,
                        controller:
                            TextEditingController(text: 'Toyota Corolla'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Model',
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller:
                                  TextEditingController(text: 'Automatic'),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Transmission',
                              ),
                            ),
                          ),
                          gap(0, width: width * 0.02),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller:
                                  TextEditingController(text: '2,000/Day'),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Price per day',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gap(10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rental Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      TextFormField(
                        readOnly: true,
                        controller:
                            TextEditingController(text: 'Cash-on-pickup'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Payment Method',
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                  text: 'January 1, 2025'),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Pick up date',
                              ),
                            ),
                          ),
                          gap(0, width: width * 0.02),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                  text: 'January 2, 2025'),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Return date',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary_100,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Reserve Now'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
