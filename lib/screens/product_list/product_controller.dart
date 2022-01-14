import 'dart:convert';

import 'package:dokani/constant/AppConstant.dart';
import 'package:dokani/models/filter_dm.dart';
import 'package:dokani/models/product_dm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  BuildContext context;

  var isLoading = false;
  ProductController(this.context);
  List<FilterDm> filterItems = [];

  List<ProductDm> productList = [];

  @override
  void onInit() {
    filterItems = List.from(AppConstant.filterItems);
    getLocalData();
    super.onInit();
  }

  onFilterSelec(int index) {
    filterItems[index].isSelected = !filterItems[index].isSelected;
    update();
  }

  getLocalData() async {
    isLoading = true;
    update();
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/response.json");

    productList = favoriteDmFromJson(data.toString());
    update();
    isLoading = false;
    update();
  }

  bool discountVisible(index) {
    if (productList[index].regularPrice == productList[index].price) {
      return false;
    } else if (productList[index].regularPrice == '') {
      return false;
    } else {
      return true;
    }
  }
}
