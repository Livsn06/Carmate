import 'package:flutter/material.dart';

class BookingFormScreen extends StatelessWidget {
  const BookingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Form'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is Booking Form'),
      ),
    );
  }
}
