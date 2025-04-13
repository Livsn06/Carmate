import 'package:flutter/material.dart';
import 'package:get/get.dart';

void navigateTo({required Widget route, arguments}) =>
    Get.to(() => route, transition: Transition.fade, arguments: arguments);
