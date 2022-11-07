import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PositiveReview extends StatelessWidget {
  const PositiveReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        // ignore: prefer_interpolation_to_compose_strings
        'Thank you. What more can we do for you to give us 10?',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: currentWidth < 1024 ? 18 : 8.sp,
          color: const Color(0xff002247),
        ),
      ),
    );
  }
}
