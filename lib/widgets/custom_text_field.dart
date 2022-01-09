import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.emailTextController,
    required this.hints,
    required this.svgPath,
  }) : super(key: key);

  final TextEditingController emailTextController;
  final String hints, svgPath;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x214d5877),
            offset: Offset(2, 3),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: width * 0.05),
          SizedBox(
            height: height * 0.027,
            width: height * 0.027,
            child: SvgPicture.asset(svgPath),
          ),
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              controller: emailTextController,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 15, bottom: 11, top: 11, right: 15),
                hintText: hints,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: Color(0xFFA4A9AF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
