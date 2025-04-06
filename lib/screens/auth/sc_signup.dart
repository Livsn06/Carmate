// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/screens/home/sc_home.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:car_reservation_system/utils/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sc_login.dart';

class SignupScreen extends StatelessWidget with CustomColors {
  SignupScreen({super.key});

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primary_80,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary_80,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.08,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: size.height - 70),
          child: Padding(
            padding: EdgeInsets.only(top: size.width * 0.4),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: size.width * 0.09),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: grey,
                      ),
                      hintText: 'Firstname',
                      hintStyle: TextStyle(
                        color: grey,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  gap(size.width * 0.05),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: grey,
                      ),
                      hintText: 'Lastname',
                      hintStyle: TextStyle(
                        color: grey,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  gap(size.width * 0.05),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: grey,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: grey,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  gap(size.width * 0.05),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: grey,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: grey,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: grey,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  gap(size.width * 0.05),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: grey,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: grey,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: grey,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  gap(size.width * 0.1),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => HomeScreen());
                    },
                    iconAlignment: IconAlignment.end,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary_80,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.width * 0.038),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: size.width * 0.05),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.off(() => LoginScreen()),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: primary_80,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
