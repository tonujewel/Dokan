import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.backGroundColor,
  }) : super(key: key);

  final Function() onTap;
  final String title;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),

        backgroundColor: MaterialStateProperty.all(
            backGroundColor ?? const Color(0xFFF75F55)), //Background Color
        shadowColor: MaterialStateProperty.all(
            backGroundColor ?? const Color(0xFFF75F55)),
      ),
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kHeight * 0.015),
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        width: kWidth,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
