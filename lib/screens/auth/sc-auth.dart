// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/screens/auth/sc-signup.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/ui/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';
import 'sc-login.dart';

class AuthScreen extends StatelessWidget with CustomColors {
  AuthScreen({super.key});

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      primary: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _buildGradientBackground(),
        child: _buildContent(),
      ),
    );
  }

  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [primary_100, primary_80],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogo(),
        _buildTitle(),
        _buildSubtitle(),
        gap(size.width * 0.13),
        _buildAuthButton("LOG IN", onPressed: () {
          navigateTo(route: LoginScreen());
        }),
        gap(10),
        _buildAuthButton("SIGN UP", onPressed: () {
          navigateTo(route: SignupScreen());
        }),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/images/logo2.png', scale: size.width * 0.003);
  }

  Widget _buildTitle() {
    return Text(
      'CARMATE',
      style: TextStyle(
        color: Colors.white,
        fontSize: size.width * 0.12,
        fontWeight: FontWeight.bold,
        letterSpacing: size.width * 0.02,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Your car rental buddy!',
      style: TextStyle(
        color: Colors.white,
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.bold,
        letterSpacing: size.width * 0.01,
      ),
    );
  }

  Widget _buildAuthButton(String text, {required void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width * 0.5, size.width * 0.1),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: size.width * 0.05),
      ),
    );
  }
}
