import 'package:flutter/material.dart';
import 'package:nps_app/View/radiocomment.dart';

import 'View/intro.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      title: 'NPS',
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
      routes: {'/intro': (context) => IntroPage()},
    );
  }
}




// Container(
//                             padding: const EdgeInsets.only(right: 0),
//                             child: Row(
//                               children: <Widget>[
//                                 Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: currentWidth < 1024
//                                               ? 18
//                                               : 24), // Resize this responsive
//                                       child: SizedBox(
//                                         child: Container(
//                                           height: 8,
//                                           width:
//                                               currentWidth < 1024 ? 170 : 242,
//                                           decoration: const BoxDecoration(
//                                               border: Border(
//                                             bottom: BorderSide(
//                                               color: Color(0xffd7d9da),
//                                             ),
//                                             left: BorderSide(
//                                               color: Color(0xffd7d9da),
//                                             ),
//                                             right: BorderSide(
//                                               color: Color(0xffd7d9da),
//                                             ),
//                                           )),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: currentWidth < 1024
//                                           ? 35
//                                           : 49), // Resize this responsive
//                                   child: SizedBox(
//                                     child: Container(
//                                       height: 8,
//                                       width: currentWidth < 1024 ? 38 : 48,
//                                       decoration: const BoxDecoration(
//                                           border: Border(
//                                         bottom: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                         left: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                         right: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                       )),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: currentWidth < 1024
//                                           ? 30
//                                           : 48), // Resize this responsive
//                                   child: SizedBox(
//                                     child: Container(
//                                       height: 8,
//                                       width: currentWidth < 1024 ? 38 : 50,
//                                       decoration: const BoxDecoration(
//                                           border: Border(
//                                         bottom: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                         left: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                         right: BorderSide(
//                                           color: Color(0xffd7d9da),
//                                         ),
//                                       )),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(right: 0),
//                             child: Row(
//                               children: <Widget>[
//                                 Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           left: currentWidth < 1024
//                                               ? 50
//                                               : 100), // Resize this responsive
//                                       child: Text('Needs improvement',
//                                           style: TextStyle(
//                                             fontFamily: 'Arial Narrow',
//                                             color:
//                                                 Colors.black.withOpacity(0.3),
//                                             fontSize: 12,
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: currentWidth < 1024
//                                           ? 67
//                                           : 140), // Resize this responsive
//                                   child: Text('Happy',
//                                       style: TextStyle(
//                                         fontFamily: 'Arial Narrow',
//                                         color: Colors.black.withOpacity(0.3),
//                                         fontSize: 12,
//                                       )),
//                                 ),
//                                 Padding(
//                                   padding:  EdgeInsets.only(
//                                       left: currentWidth < 1024
//                                           ? 30 : 70), // Resize this responsive
//                                   child: Text('Delighted',
//                                       style: TextStyle(
//                                         fontFamily: 'Arial Narrow',
//                                         color: Colors.black.withOpacity(0.3),
//                                         fontSize: 12,
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
