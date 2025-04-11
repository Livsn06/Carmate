import 'package:car_reservation_system/screens/start/sc-splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'screens/start/sc_splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
