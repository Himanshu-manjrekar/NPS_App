import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction?> yesCanceldialog(
    BuildContext context,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext dailogctx) {
          return AlertDialog(
            content: Text(
              body,
              style: const TextStyle(
                fontFamily: 'Arial Narrow',
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    //
                    // Navigator.of(dailogctx).pop(DialogsAction.yes),
                    Navigator.pushNamed(dailogctx, '/intro'),
                // Navigator.pop(dailogctx),
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    color: Color(0xff07245d),
                    fontFamily: 'Arial Narrow',
                  ),
                ),
              )
            ],
          );
        });
  }
}
