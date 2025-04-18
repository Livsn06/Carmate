import 'package:car_reservation_system/controllers/ct-screen-handler-index.dart';
import 'package:car_reservation_system/screens/booking/sc-book-list.dart';
import 'package:car_reservation_system/screens/profile/sc-profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/sc-home.dart';

// ignore: must_be_immutable
class ScreenHandler extends StatelessWidget {
  ScreenHandler({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    BookingListScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenHandlerIndexController>(
      init: ScreenHandlerIndexController(),
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            body: screens[controller.currentIndex],
            bottomNavigationBar: _buildBottomNavigationBar(controller),
          );
        });
      },
    );
  }

  Widget _buildBottomNavigationBar(ScreenHandlerIndexController controller) {
    return BottomNavigationBar(
      onTap: (index) => controller.setCurrentIndex(index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Bookmarks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
