import 'package:flutter/material.dart';

class PositiveReview extends StatelessWidget {
  const PositiveReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        // ignore: prefer_interpolation_to_compose_strings
        'Thank you. What more can we do for you to give us 10?',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: 15,
          color: Color(0xff002247),
        ),
      ),
    );
  }
}
