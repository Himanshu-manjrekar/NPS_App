import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultReview extends StatelessWidget {
  const DefaultReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Suggestion Box',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: 8.sp, // Resize
          color: const Color(0xff002247),
        ),
      ),
    );
  }
}
