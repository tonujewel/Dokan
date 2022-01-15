import 'package:dokani/models/signUpDm.dart';
import 'package:dokani/networking/api_manager.dart';
import 'package:dokani/networking/url.dart';
import 'package:dokani/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassword = TextEditingController();

  void checkValidation() {
    if (nameController.text.isEmpty) {
      errorSnackbar('Name required');
      return;
    }

    if (emailController.text.isEmpty) {
      errorSnackbar('Email required');
      return;
    }

    if (passwordController.text.isEmpty) {
      errorSnackbar('Password required');
      return;
    }

    if (passwordController.text.length < 6) {
      errorSnackbar('Password must be at least 6 character');
      return;
    }

    if (confirmPassword.text.isEmpty) {
      errorSnackbar('Confirm Password required');
      return;
    }

    if (confirmPassword.text != passwordController.text) {
      errorSnackbar('Password must be same');
      return;
    }

    signUpApiCall();
  }

  void signUpApiCall() async {
    isLoading = true;
    update();

    var body = {
      "username": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };
    var headers = {'Content-Type': 'application/json'};

    APIManager.postAPICall(url: URL.signUpURL, body: body, header: headers)
        .then(
      (response) {
        isLoading = false;
        update();

        if (response != null) {
          SignUpDm signUpDm = SignUpDm.fromJson(response);
          Get.back();
          successSnackbar(signUpDm.message);
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
