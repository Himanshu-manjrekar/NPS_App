import 'package:flutter/material.dart';

class GreatReview extends StatelessWidget {
  const GreatReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Thank you. Can you tell us what you liked the most about your experience?',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: 15,
          color: Color(0xff002247),
        ),
      ),
    );
  }
}
