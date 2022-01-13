// // Container(
// //   decoration: BoxDecoration(
// //     borderRadius:
// //         BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
// //     gradient: LinearGradient(
// //       begin: Alignment(-1.0, 1.46),
// //       end: Alignment(1.0, 1.46),
// //       colors: [const Color(0xffff679b), const Color(0xffff7b51)],
// //       stops: [0.0, 1.0],
// //     ),
// //     boxShadow: [
// //       BoxShadow(
// //         color: const Color(0x25b82d48),
// //         offset: Offset(0, 12),
// //         blurRadius: 56,
// //       ),
// //     ],
// //   ),
// // )

// // PixelPerfect.extended(
// //       image: Image.asset(
// //         'assets/images/login.png',
// //         width: Get.width,
// //         height: Get.height,
// //       ),

// //       child: Column(children: [],)

// //     )

// import 'package:flutter/material.dart';

// class MyTestClass extends StatelessWidget {
//   const MyTestClass({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.indigo,
//         onPressed: () {},
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Color.fromRGBO(219, 84, 84, 1),
//         notchMargin: 8.0,
//         shape: AutomaticNotchedShape(
//           RoundedRectangleBorder(),
//           StadiumBorder(
//             side: BorderSide(),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: new Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(
//                   Icons.person_outline,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.info_outline,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//               SizedBox(width: 40), // The dum
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          title: const Text("Flutter Learning"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
          ],
        )

        // Column(children: [
        //   const SizedBox(height: 100),
        //   Container(
        //     padding: const EdgeInsets.only(left: 10),
        //     margin: const EdgeInsets.symmetric(horizontal: 10),
        //     width: Get.width,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //       boxShadow: const [
        //         BoxShadow(
        //           color: Color(0x1a395ab8),
        //           offset: Offset(0, 3),
        //           blurRadius: 8,
        //         ),
        //       ],
        //     ),
        //     child: ExpansionPanelList(
        //       expandedHeaderPadding: EdgeInsets.zero,
        //       elevation: 0,
        //       animationDuration: const Duration(milliseconds: 300),
        //       children: [
        //         ExpansionPanel(
        //           headerBuilder: (context, isExpanded) {
        //             return Container(
        //               child: Row(
        //                 children: [
        //                   SvgPicture.asset(
        //                     'assets/svg/profile.svg',
        //                     height: 24,
        //                     width: 24,
        //                   ),
        //                   SizedBox(width: 10),
        //                   Text('Title'),
        //                 ],
        //               ),
        //             );
        //           },
        //           body: Container(
        //             // color: Colors.white,
        //             child: Row(
        //               children: const [
        //                 Text('Body'),
        //               ],
        //             ),
        //           ),
        //           isExpanded: _expanded,
        //           canTapOnHeader: true,
        //         ),
        //         ExpansionPanel(
        //           backgroundColor: Colors.black,
        //           headerBuilder: (context, isExpanded) {
        //             return Container(
        //               color: Colors.red,
        //               child: Row(
        //                 children: const [
        //                   Text('Title'),
        //                 ],
        //               ),
        //             );
        //           },
        //           body: Container(
        //             color: Colors.green,
        //             child: Row(
        //               children: const [
        //                 Text('Body'),
        //               ],
        //             ),
        //           ),
        //           isExpanded: _expanded,
        //           canTapOnHeader: true,
        //         ),
        //       ],
        //       dividerColor: Colors.grey,
        //       expansionCallback: (panelIndex, isExpanded) {
        //         _expanded = !_expanded;
        //         setState(() {});
        //       },
        //     ),
        //   ),
        // ]),

        );
  }
}


// class MyAppState extends State<MyApp> with TickerProviderStateMixin {
//   double _height = 50.0;
//   double _width = 20.0;
//   var _color = Colors.blue;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         body: new Center(
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new AnimatedSize(

//                 curve: Curves.fastOutSlowIn, child: new Container(
//                 width: _width,
//                 height: _height,
//                 color: _color,
//               ), vsync: this, duration: new Duration(seconds: 2),),
//               new Divider(height: 35.0,),
//               new Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   new IconButton(
//                       icon: new Icon(Icons.arrow_upward, color: Colors.green,),
//                       onPressed: () =>
//                           setState(() {
//                             _color = Colors.green;
//                             _height = 95.0;
//                           })),
//                   new IconButton(
//                       icon: new Icon(Icons.arrow_forward, color: Colors.red,),
//                       onPressed: () =>
//                           setState(() {
//                             _color = Colors.red;
//                             _width = 45.0;
//                           })),
//                 ],
//               )
//             ],)
//           ,)
//     );
//   }
// }
