import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultReview extends StatelessWidget {
  const DefaultReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Suggestion Box',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: currentWidth < 1024 ? 18 : 8.sp, // Resize
          color: const Color(0xff002247),
        ),
      ),
    );
  }
}
