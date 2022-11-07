import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

enum DialogsAction { yes, cancel }

class TechnicalAlertDialogs {
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
                onPressed: () => Phoenix.rebirth(context),
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
