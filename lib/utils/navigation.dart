import 'package:flutter/material.dart';
import 'package:get/get.dart';

void navigateTo({required Widget route}) =>
    Get.to(() => route, transition: Transition.fade);
