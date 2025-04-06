import 'package:car_reservation_system/screens/home/sc_home.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onReady() {
    _navigateToNext();
    super.onReady();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => HomeScreen());
  }
}
