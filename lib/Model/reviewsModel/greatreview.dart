import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GreatReview extends StatelessWidget {
  const GreatReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Thank you. Can you tell us what you liked the most about your experience?',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: currentWidth < 1024 ? 18 : 8.sp, // resize
          color: const Color(0xff002247),
        ),
      ),
    );
  }
}
