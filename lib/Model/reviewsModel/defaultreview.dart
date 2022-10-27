import 'package:flutter/material.dart';

class DefaultReview extends StatelessWidget {
  const DefaultReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Suggestion Box',
        style: TextStyle(
          fontFamily: 'Arial Narrow',
          fontSize: 15,
          color: Color(0xff002247),
        ),
      ),
    );
  }
}
