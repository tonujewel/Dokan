import 'package:dokani/screens/authentication/sign_up/sign_up_controller.dart';
import 'package:dokani/screens/home/home_screen.dart';
import 'package:dokani/widgets/custom_button.dart';
import 'package:dokani/widgets/custom_progress.dart';
import 'package:dokani/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (_controller) {
          return CustomProgress(
            isLoading: _controller.isLoading,
            child: Scaffold(
              backgroundColor: const Color(0xFFF8F8F8),
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: kWidth * .12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: kHeight * 0.065),
                      avatarSection(kHeight),
                      SizedBox(height: kHeight * 0.065),
                      CustomTextField(
                        controller: _controller.nameController,
                        hints: 'Username',
                        svgPath: 'assets/svg/profile.svg',
                      ),
                      SizedBox(height: kHeight * 0.02),
                      CustomTextField(
                        controller: _controller.emailController,
                        hints: 'Email',
                        svgPath: 'assets/svg/sms.svg',
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: kHeight * 0.02),
                      CustomTextField(
                        controller: _controller.passwordController,
                        hints: 'Password',
                        svgPath: 'assets/svg/lock.svg',
                        inputType: TextInputType.visiblePassword,
                        obscure: true,
                      ),
                      SizedBox(height: kHeight * 0.02),
                      CustomTextField(
                        obscure: true,
                        controller: _controller.confirmPassword,
                        hints: 'Confirm Password',
                        svgPath: 'assets/svg/lock.svg',
                        inputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: kHeight * 0.045),
                      CustomButton(
                        onTap: () => _controller.checkValidation(),
                        title: 'Sign Up',
                      ),
                      SizedBox(height: kHeight * 0.04),
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
                      SizedBox(height: kHeight * 0.03),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: RichText(
                          text: const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff383C40),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff2893E3),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Stack avatarSection(double kHeight) {
    return Stack(
      children: [
        Container(
          width: kHeight * .15,
          height: kHeight * .15,
          padding: EdgeInsets.all(kHeight * 0.055),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x1a395ab8),
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: SvgPicture.asset('assets/svg/profile.svg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: kHeight * 0.04,
            width: kHeight * 0.04,
            padding: EdgeInsets.all(kHeight * 0.01),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              gradient: LinearGradient(
                begin: Alignment(1.91, 0.08),
                end: Alignment(0.07, -1.0),
                colors: [Color(0xfff2709c), Color(0xffff9472)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x408b2f40),
                  offset: Offset(0, 14),
                  blurRadius: 46,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'assets/svg/camera.svg',
            ),
          ),
        ),
      ],
    );
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
