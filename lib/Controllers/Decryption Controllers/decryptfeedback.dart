// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt1;
import 'package:flutter/cupertino.dart';
import 'package:nps_app/Controllers/Encryption Controllers/randomkeygenerator.dart';
import '../../Model/alertModel/alert_dialog.dart';
import '../../config.properties' as config;

class Decryptfeedback {
  DecryptFeedback(String req, BuildContext context) async {
    try {
      final encryptedRandomKey = encrypt1.Key.fromUtf8(digitKey);
      final iv = encrypt1.IV.fromUtf8(config.iv);
      final encrypter = encrypt1.Encrypter(
          encrypt1.AES(encryptedRandomKey, mode: encrypt1.AESMode.cbc));
      final decrypted = req;
      final decryptedResponse = encrypter.decrypt64(decrypted, iv: iv);
      final decryptedResult = jsonDecode(decryptedResponse);
      final decryptStatus =
          jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultStatus']));
      if (decryptStatus == 0) {
        await AlertDialogs.yesCanceldialog(context,
            jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultMsg'])));
      } else {
        await AlertDialogs.yesCanceldialog(context,
            jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultMsg'])));
      }
    } on Exception catch (_) {
      await AlertDialogs.yesCanceldialog(
          context, 'Technical error. Please contact your Admin!');
    }
  }
}
