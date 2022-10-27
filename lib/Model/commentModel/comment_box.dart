import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      // color: Colors.red,
      height: 200,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        maxLines: 7,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
          ),
          hintText: 'Write your suggestion here',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
