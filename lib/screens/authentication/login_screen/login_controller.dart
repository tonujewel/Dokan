import 'package:dokani/models/loginDm.dart';
import 'package:dokani/networking/api_manager.dart';
import 'package:dokani/networking/url.dart';
import 'package:dokani/screens/home/home_screen.dart';
import 'package:dokani/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../main.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  var userNameTextController = TextEditingController();
  var passwordController = TextEditingController();

  void loginValidation() {
    if (userNameTextController.text.isEmpty) {
      errorSnackbar('Username required');
      return;
    }

    if (passwordController.text.isEmpty) {
      errorSnackbar('Password required');
      return;
    }

    if (passwordController.text.length > 6) {
      errorSnackbar('Password must be at least 6 character');
      return;
    }

    loginApiCall();
  }

  void loginApiCall() {
    isLoading = true;
    update();

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    APIManager.postAPICall(
            url:
                "${URL.signInURL}?username=${userNameTextController.text}&password=${passwordController.text}",
            header: headers)
        .then(
      (response) {
        isLoading = false;
        update();
        if (response != null) {
          LoginDm loginDm = LoginDm.fromJson(response);
          prefs?.setString(AppConstant.USER_TOKEN_KEY, loginDm.token);
          Get.offAll(() => const HomeScreen());
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
}
