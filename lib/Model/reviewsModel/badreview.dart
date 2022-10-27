import 'package:flutter/material.dart';

class BadReview extends StatelessWidget {
  const BadReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        // ignore: prefer_interpolation_to_compose_strings
        'We are sorry that we did not meet your expectations. What we can do to improve your experience?',
        style: TextStyle(
            fontFamily: 'Arial Narrow',
            fontSize: 15,
            color: Color(
                0xff002247)), // Resize the Fontsize for responsive behviour
      ),
    );
  }
}
