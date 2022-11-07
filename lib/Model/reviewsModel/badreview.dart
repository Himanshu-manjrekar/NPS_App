import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BadReview extends StatelessWidget {
  const BadReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        // ignore: prefer_interpolation_to_compose_strings
        'We are sorry that we did not meet your expectations. What we can do to improve your experience?',
        style: TextStyle(
            fontFamily: 'Arial Narrow',
            fontSize: currentWidth < 1024 ? 18 : 8.sp, // Resize
            color: const Color(
                0xff002247)), // Resize the Fontsize for responsive behviour
      ),
    );
  }
}
