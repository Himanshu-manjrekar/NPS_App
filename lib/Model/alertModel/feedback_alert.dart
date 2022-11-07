import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class FeedbackAlerts {
  static Future<DialogsAction?> yesCanceldialog(
    BuildContext context,
    String body,
  ) async {
    // ignore: unused_local_variable
    final action = await showDialog(
        context: context,
        builder: (BuildContext feedbckalertctx) {
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
                    Navigator.of(feedbckalertctx).pop(DialogsAction.yes),
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
    return null;
  }
}
