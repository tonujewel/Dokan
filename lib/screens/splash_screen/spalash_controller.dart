import 'dart:async';
import 'package:dokani/screens/authentication/login_screen/login_screen.dart';
import 'package:dokani/screens/home/home_screen.dart';
import 'package:dokani/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../main.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // shared preference init for global use
    prefs = await SharedPreferences.getInstance();

    // splash screen timer
    Timer(const Duration(seconds: 3), () {
      if (prefs?.getString(AppConstant.USER_TOKEN_KEY) == null) {
        Get.off(() => const LoginScreen());
      } else {
        Get.off(() => const HomeScreen());
      }
    });
    super.onInit();
  }
}
