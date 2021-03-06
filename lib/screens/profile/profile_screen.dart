import 'package:dokani/screens/profile/profile_controller.dart';
import 'package:dokani/widgets/custom_button.dart';
import 'package:dokani/widgets/custom_progress.dart';
import 'package:dokani/widgets/outline_text_field.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (_controller) {
          return CustomProgress(
            isLoading: _controller.isLoading,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFFF8F8F8),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: kHeight * 0.09),
                      SizedBox(width: kWidth),
                      title(),
                      userSection(kHeight, _controller),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: ExpansionPanelList(
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              // expandedHeaderPadding: const EdgeInsets.all(10),
                              // dividerColor: Colors.red,
                              elevation: 0,
                              expansionCallback: (int index, bool isExpanded) {
                                _controller.expandCollapsAction(
                                    isExpanded, index);

                                //  print('index $index');
                                // setState(() {
                                //   _items[index].isExpanded = !isExpanded;
                                // });
                              },
                              children: [
                                accountExpantionPanel(
                                    _controller, kWidth, kHeight),
                                passwordExpantionPanel(
                                    _controller, kWidth, kHeight),
                                notificationExpantionPanel(
                                    _controller, kWidth, kHeight),
                                wishListExpantionPanel(
                                    _controller, kWidth, kHeight),
                              ]),
                        ),
                      ),
                      SizedBox(height: kHeight * 0.051),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  ExpansionPanel accountExpantionPanel(
      ProfileController _controller, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: _controller.isAccountOpen,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            const Text(
              'Email',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              enable: false,
              hintText: 'youremail@xmail.com',
              controller: _controller.emailTextController,
            ),

            SizedBox(height: kHeight * 0.03),

            // user name
            const Text(
              'Username',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              enable: false,
              hintText: 'username',
              controller: _controller.userNameTextController,
            ),
            SizedBox(height: kHeight * 0.03),
            // First name
            const Text(
              'First name',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              hintText: 'First Name',
              controller: _controller.firstNameTextController,
            ),
            SizedBox(height: kHeight * 0.03),
            // Apt, Suite, Bldg (optional)
            const Text(
              'Last Name',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              hintText: 'Last Name',
              controller: _controller.lastNameTextController,
            ),
            SizedBox(height: kHeight * 0.03),

            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => _controller.expandCollapsAction(
                        _controller.isAccountOpen, 0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: kHeight * 0.023),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF818995)),
                          borderRadius: BorderRadius.circular(7)),
                      width: kWidth,
                      child: const Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF818995),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kWidth * 0.05),
                Flexible(
                  child: CustomButton(
                    backGroundColor: const Color(0xFF1ABC9C),
                    onTap: () => _controller.updateUserInfo(),
                    title: 'Save',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row(
          children: [
            SizedBox(width: kWidth * 0.05),
            SvgPicture.asset(
              'assets/svg/profile.svg',
              height: kHeight * 0.035,
              width: kHeight * 0.035,
            ),
            SizedBox(width: kWidth * 0.05),
            const Text(
              'Account',
              style: TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }

  ExpansionPanel passwordExpantionPanel(
      ProfileController _controller, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: _controller.isPasswordOpen,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // old
            const Text(
              'Old password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              hintText: 'xxxxxx',
              controller: _controller.emailTextController,
            ),
            SizedBox(height: kHeight * 0.02),
            // new password
            const Text(
              'New password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              hintText: 'xxxxxx',
              controller: _controller.emailTextController,
            ),
            SizedBox(height: kHeight * 0.02),
            // confrm password
            const Text(
              'Confirm password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            OutlineTextField(
              hintText: 'xxxxxx',
              controller: _controller.emailTextController,
            ),

            SizedBox(height: kHeight * 0.02),
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: kHeight * 0.023),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF818995)),
                          borderRadius: BorderRadius.circular(7)),
                      width: kWidth,
                      child: const Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF818995),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kWidth * 0.05),
                Flexible(
                  child: CustomButton(
                    backGroundColor: const Color(0xFF1ABC9C),
                    onTap: () => Get.back(),
                    title: 'Save',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row(
          children: [
            SizedBox(width: kWidth * 0.05),
            SvgPicture.asset(
              'assets/svg/lock.svg',
              height: kHeight * 0.035,
              width: kHeight * 0.035,
            ),
            SizedBox(width: kWidth * 0.05),
            const Text(
              'Password',
              style: TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }

  ExpansionPanel notificationExpantionPanel(
      ProfileController _controller, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: _controller.isNotificationOpen,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.05),
            const Text(
              'Notification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kHeight * 0.05),
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row(
          children: [
            SizedBox(width: kWidth * 0.05),
            SvgPicture.asset(
              'assets/svg/notification.svg',
              height: kHeight * 0.035,
              width: kHeight * 0.035,
            ),
            SizedBox(width: kWidth * 0.05),
            const Text(
              'Notification',
              style: TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }

  ExpansionPanel wishListExpantionPanel(
      ProfileController _controller, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: _controller.isWishListOpen,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.05),
            const Text(
              'Wishlist',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kHeight * 0.05),
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row(
          children: [
            SizedBox(width: kWidth * 0.05),
            SvgPicture.asset(
              'assets/svg/love.svg',
              height: kHeight * 0.035,
              width: kHeight * 0.035,
            ),
            SizedBox(width: kWidth * 0.05),
            Row(
              children: const [
                Text(
                  'Wishlist ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '(00)',
                  style: TextStyle(fontSize: 18, color: Color(0xFF7C8592)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Column userSection(double kHeight, ProfileController _controller) {
    return Column(
      children: [
        SizedBox(height: kHeight * 0.065),
        FDottedLine(
            color: const Color(0xFFF75F55),
            strokeWidth: 2.0,
            dottedLength: 1.0,
            space: 3.0,
            corner: FDottedLineCorner.all(67),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(child: Image.asset('assets/images/avatar.png')),
            )),
        SizedBox(height: kHeight * 0.05),
        Text(
          '${_controller.firstName} ${_controller.lastName}',
          style: const TextStyle(
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: kHeight * 0.01),
        Text(
          '${_controller.emailAddress}',
          style: const TextStyle(
              // fontSize: 25,
              fontFamily: 'Roboto',
              color: Color(0xFF535353),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: kHeight * 0.051),
      ],
    );
  }

  Text title() {
    return const Text(
      'My Account',
      style: TextStyle(
          fontSize: 22,
          fontFamily: 'Roboto',
          color: Color(0xFF222455),
          fontWeight: FontWeight.w700),
    );
  }
}
