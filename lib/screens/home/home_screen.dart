import 'package:dokani/screens/home/home_controller.dart';
import 'package:dokani/style/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: _controller.currentScreen,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.snackbar('Search', 'Search');
              },
              child: Container(
                width: kWidth,
                height: kHeight,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, 1.46),
                    end: Alignment(1.0, 1.46),
                    colors: [Color(0xffff679b), Color(0xffff7b51)],
                    stops: [0.0, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x25b82d48),
                      offset: Offset(0, 12),
                      blurRadius: 56,
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/svg/search.svg'),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              notchMargin: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomItem(
                      isSelected: _controller.selectedIndex == 0 ? true : false,
                      onTap: () => _controller.updateTabSelection(0),
                      svgPath: 'assets/svg/home.svg',
                    ),
                    BottomItem(
                      isSelected: _controller.selectedIndex == 1 ? true : false,
                      onTap: () => _controller.updateTabSelection(1),
                      svgPath: 'assets/svg/category.svg',
                    ),
                    const SizedBox(width: 50.0),
                    BottomItem(
                      isSelected: _controller.selectedIndex == 2 ? true : false,
                      onTap: () => _controller.updateTabSelection(2),
                      svgPath: 'assets/svg/cart.svg',
                    ),
                    BottomItem(
                      isSelected: _controller.selectedIndex == 3 ? true : false,
                      onTap: () => _controller.updateTabSelection(3),
                      svgPath: 'assets/svg/profile.svg',
                    ),
                  ],
                ),
              ),
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
            ),
          );
        });
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem({
    Key? key,
    required this.onTap,
    required this.svgPath,
    required this.isSelected,
  }) : super(key: key);

  final Function() onTap;
  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 25,
        width: 25,
        child: SvgPicture.asset(
          svgPath,
          color: isSelected ? kSelectedIconColor : kDeselctIconColor,
        ),
      ),
    );
  }
}
