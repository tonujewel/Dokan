import 'package:dokani/screens/cart/cart_screen.dart';
import 'package:dokani/screens/category/category_screen.dart';
import 'package:dokani/screens/product_list/product_list.dart';
import 'package:dokani/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;

  Widget currentScreen = const ProductListScreen();

  @override
  void onInit() {
    super.onInit();
  }

  void updateTabSelection(int index) {
    selectedIndex = index;
    if (index == 0) {
      currentScreen = const ProductListScreen();
      update();
    }

    if (index == 1) {
      currentScreen = const CategoryScreen();
      update();
    }
    if (index == 2) {
      currentScreen = const CartScreen();
      update();
    }
    if (index == 3) {
      currentScreen = const ProfileScreen();
      update();
    }

    update();
  }
}
