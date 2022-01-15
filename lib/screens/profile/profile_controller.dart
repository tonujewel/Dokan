import 'package:dokani/models/userDm.dart';
import 'package:dokani/networking/api_manager.dart';
import 'package:dokani/networking/url.dart';
import 'package:dokani/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProfileController extends GetxController {
  bool isAccountOpen = false;
  bool isPasswordOpen = false;
  bool isNotificationOpen = false;
  bool isWishListOpen = false;

  var width = Get.width;
  var isLoading = false;

  var emailTextController = TextEditingController();
  var userNameTextController = TextEditingController();
  var firstNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();

  UserDm? userDm;

  String? firstName = "";
  String? lastName = "";
  String? emailAddress;

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  void getUserInfo() {
    isLoading = true;
    update();

    var headers = {
      'Authorization': 'Bearer ${prefs?.getString(AppConstant.USER_TOKEN_KEY)}',
    };

    APIManager.postAPICall(url: URL.userInformationURL, header: headers).then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          userDm = UserDm.fromJson(response);

          if (userDm?.email != null) {
            emailTextController.text = emailAddress = "${userDm?.email}";
          }

          if (userDm?.username != null) {
            userNameTextController.text = "${userDm?.username}";
          }
          if (userDm?.firstName != null) {
            firstNameTextController.text = firstName = "${userDm?.firstName}";
          }
          if (userDm?.lastName != null) {
            lastNameTextController.text = lastName = "${userDm?.lastName}";
          }

          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        apiErrorMessage("$error");
        if (kDebugMode) {
          print("ERROR::$error");
        }
      },
    );
  }

  void updateUserInfo() {
    if (firstNameTextController.text.isEmpty) {
      errorSnackbar('First Name required');
      return;
    }

    if (lastNameTextController.text.isEmpty) {
      errorSnackbar('Last Name required');
      return;
    }

    isLoading = true;
    update();

    var body = {
      "first_name": firstNameTextController.text,
      "last_name": lastNameTextController.text
    };

    var headers = {
      'Authorization': 'Bearer ${prefs?.getString(AppConstant.USER_TOKEN_KEY)}',
      'Content-Type': 'application/json'
    };

    if (kDebugMode) {
      print('body ::: $body');
    }

    APIManager.postAPICall(
            url: "${URL.updateUserInformationURL}${userDm!.id}",
            header: headers,
            body: body)
        .then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          successSnackbar("User successfully updated");
          update();
        }
      },
      onError: (error) {
        isLoading = false;
        update();
        apiErrorMessage("$error");
        if (kDebugMode) {
          print("ERROR::$error");
        }
      },
    );
  }

  void expandCollapsAction(bool value, index) {
    if (index == 0) {
      isAccountOpen = !value;
      update();
    }

    if (index == 1) {
      isPasswordOpen = !value;
      update();
    }

    if (index == 2) {
      isNotificationOpen = !value;
      update();
    }

    if (index == 3) {
      isWishListOpen = !value;
      update();
    }
  }
}
