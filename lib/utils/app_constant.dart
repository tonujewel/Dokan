import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstant {
  // ignore: non_constant_identifier_names
  static String USER_TOKEN_KEY = "USER_TOKEN";
}

errorSnackbar(String msg) {
  return Get.snackbar('Error', msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white);
}

successSnackbar(String msg) {
  return Get.snackbar('Success', msg,
      snackPosition: SnackPosition.TOP, colorText: Colors.white);
}
