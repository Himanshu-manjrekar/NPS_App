import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';
import 'View/intro.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    Phoenix(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        title: 'NPS_UAT',
        home: IntroPage(),
        debugShowCheckedModeBanner: false,
        routes: {'/intro': (context) => IntroPage()},
      );
    });
  }
}
