import 'package:dokani/style/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "Home";

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            child: RaisedButton(
              child: Text(text),
              onPressed: () {},
            ),
          ),
          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.blue),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // tooltip: 'Cool FAB',
        child: Container(
          width: kWidth,
          height: kHeight,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
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

      // FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       clickedCentreFAB = !clickedCentreFAB;
      //     });
      //   },
      //   tooltip: "Centre FAB",
      //   child: Container(
      //     margin: const EdgeInsets.all(15.0),
      //     child: const Icon(Icons.add),
      //   ),
      //   elevation: 4.0,
      // ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomItem(
                isSelected: selectedIndex == 0 ? true : false,
                onTap: () => updateTabSelection(0, "Home"),
                svgPath: 'assets/svg/home.svg',
              ),
              BottomItem(
                isSelected: selectedIndex == 1 ? true : false,
                onTap: () => updateTabSelection(1, "Category"),
                svgPath: 'assets/svg/category.svg',
              ),
              const SizedBox(width: 50.0),
              BottomItem(
                isSelected: selectedIndex == 2 ? true : false,
                onTap: () => updateTabSelection(2, "Home"),
                svgPath: 'assets/svg/cart.svg',
              ),
              BottomItem(
                isSelected: selectedIndex == 3 ? true : false,
                onTap: () => updateTabSelection(3, "Incoming"),
                svgPath: 'assets/svg/profile.svg',
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
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
