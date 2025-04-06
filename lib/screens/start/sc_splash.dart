// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/screens/auth/sc_auth.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/ui/colors.dart';

class SplashScreen extends StatelessWidget with CustomColors {
  SplashScreen({super.key});

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _buildBackgroundGradient(),
        child: _buildContent(),
      ),
    );
  }

  /// Background Gradient Decoration
  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [primary_100, primary_80],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  /// Main Content: Logo + Button
  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogo(),
        gap(size.width * 0.08),
        _buildGetStartedButton(),
      ],
    );
  }

  /// Logo Image
  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo1.png',
      scale: 4,
    );
  }

  /// "Get Started" Button
  Widget _buildGetStartedButton() {
    return ElevatedButton(
      onPressed: () {
        Get.off(() => AuthScreen());
      },
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width * 0.5, size.width * 0.1),
        backgroundColor: primary_80,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Get Started",
            style: TextStyle(fontSize: size.width * 0.05),
          ),
          gap(0, width: 10),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: size.width * 0.05,
          ),
        ],
      ),
    );
  }
}
