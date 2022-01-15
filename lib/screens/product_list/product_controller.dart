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
    for (var i = 0; i < filterItems.length; i++) {
      if (index == i) {
        filterItems[i].isSelected = true;
      } else {
        filterItems[i].isSelected = false;
      }
    }

    update();
  }

  void filterAction() {
    for (var i = 0; i < filterItems.length; i++) {
      if (filterItems[i].isSelected == true) {
        // newest
        if (i == 0) {
          newest();
        }
        // oldest
        if (i == 1) {
          oldest();
        }

        // price low to high
        if (i == 2) {
          priceLowToHigh();
        }
        // price low to high
        if (i == 3) {
          priceHightToLow();
        }
        // price low to high
        if (i == 4) {
          bestSelling();
        }
      }
    }
  }

  void newest() {
    productList
        .sort((a, b) => "${b.dateCreated}".compareTo("${a.dateCreated}"));
    update();
  }

  void oldest() {
    productList
        .sort((a, b) => "${a.dateCreated}".compareTo("${b.dateCreated}"));
    update();
  }

  void priceLowToHigh() {
    productList.sort(
        (a, b) => int.parse("${a.price}").compareTo(int.parse("${b.price}")));
    update();
  }

  void priceHightToLow() {
    productList.sort(
        (a, b) => int.parse("${b.price}").compareTo(int.parse("${a.price}")));
    update();
  }

  void bestSelling() {
    productList.sort((a, b) =>
        int.parse("${b.totalSales}").compareTo(int.parse("${a.totalSales}")));
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
