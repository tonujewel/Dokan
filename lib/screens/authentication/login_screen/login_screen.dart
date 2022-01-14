import 'package:dokani/screens/authentication/login_screen/login_controller.dart';
import 'package:dokani/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:dokani/widgets/custom_button.dart';
import 'package:dokani/widgets/custom_progress.dart';
import 'package:dokani/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_controller) {
          return CustomProgress(
            isLoading: _controller.isLoading,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFF8F8F8),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: kWidth * .12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: kHeight * 0.1),
                    Center(child: SvgPicture.asset('assets/svg/logo.svg')),
                    SizedBox(height: kHeight * 0.107),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: kHeight * 0.05),
                    CustomTextField(
                      controller: _controller.userNameTextController,
                      hints: 'Username',
                      svgPath: 'assets/svg/profile.svg',
                    ),
                    SizedBox(height: kHeight * 0.03),
                    CustomTextField(
                      controller: _controller.passwordController,
                      hints: 'Password',
                      obscure: true,
                      inputType: TextInputType.visiblePassword,
                      svgPath: 'assets/svg/lock.svg',
                    ),
                    SizedBox(height: kHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA4A9AF)),
                        ),
                      ],
                    ),
                    SizedBox(height: kHeight * 0.045),
                    CustomButton(
                      onTap: () => _controller.loginValidation(),
                      title: 'Login',
                    ),
                    SizedBox(height: kHeight * 0.056),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(
                            iconPath: 'assets/svg/facebook.svg',
                            kHeight: kHeight,
                            onTap: () {
                              Get.snackbar('Social', 'facebook clicked');
                            }),
                        SizedBox(width: kWidth * 0.027),
                        socialButton(
                            iconPath: 'assets/svg/google.svg',
                            kHeight: kHeight,
                            onTap: () {
                              Get.snackbar('Social', 'Google clicked');
                            }),
                      ],
                    ),
                    SizedBox(height: kHeight * 0.065),
                    GestureDetector(
                      onTap: () => Get.to(() => const SignUpScreen()),
                      child: const Text(
                        'Create New Account',
                        style: TextStyle(
                            color: Color(0xff383C40),
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget socialButton(
      {required double kHeight,
      required String iconPath,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: kHeight * .07,
        height: kHeight * .07,
        padding: EdgeInsets.all(kHeight * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1a395ab8),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
