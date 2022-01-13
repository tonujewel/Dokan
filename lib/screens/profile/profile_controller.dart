import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isOpen = false;

  var width = Get.width;
  var height = 0.0;

  void changeValue(bool value) {
    isOpen = !value;
    update();
  }

  var emailTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
