// Container(
//   decoration: BoxDecoration(
//     borderRadius:
//         BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
//     gradient: LinearGradient(
//       begin: Alignment(-1.0, 1.46),
//       end: Alignment(1.0, 1.46),
//       colors: [const Color(0xffff679b), const Color(0xffff7b51)],
//       stops: [0.0, 1.0],
//     ),
//     boxShadow: [
//       BoxShadow(
//         color: const Color(0x25b82d48),
//         offset: Offset(0, 12),
//         blurRadius: 56,
//       ),
//     ],
//   ),
// )

// PixelPerfect.extended(
//       image: Image.asset(
//         'assets/images/login.png',
//         width: Get.width,
//         height: Get.height,
//       ),

//       child: Column(children: [],)

//     )

import 'package:flutter/material.dart';

class MyTestClass extends StatelessWidget {
  const MyTestClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(219, 84, 84, 1),
        notchMargin: 8.0,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 40), // The dum
            ],
          ),
        ),
      ),
    );
    ;
  }
}
