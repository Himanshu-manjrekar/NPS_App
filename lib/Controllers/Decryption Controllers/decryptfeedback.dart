// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt1;
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:nps_app/Controllers/Encryption Controllers/randomkeygenerator.dart';
import '../../Model/alertModel/alert_dialog.dart';

class Decryptfeedback {
  DecryptFeedback(String req, BuildContext context) async {
    try {
      final encryptedRandomKey = encrypt1.Key.fromUtf8(digitKey);
      final iv = encrypt1.IV.fromUtf8('0123456789ABCDEF');
      final encrypter = encrypt1.Encrypter(
          encrypt1.AES(encryptedRandomKey, mode: encrypt1.AESMode.cbc));
      final decrypted = req;
      final decryptedResponse = encrypter.decrypt64(decrypted, iv: iv);
      final decryptedResult = jsonDecode(decryptedResponse);
      final decryptStatus =
          jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultStatus']));
      if (decryptStatus == 0) {
        await AlertDialogs.yesCanceldialog(
            context, // Here app should restart make a Restar alert for this
            jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultMsg'])));
      } else {
        await AlertDialogs.yesCanceldialog(
            context, // Here app should restart make a Restar alert for this
            jsonDecode(jsonEncode(decryptedResult['resultInfo']['resultMsg'])));
      }
    } on Exception catch (e) {
      await AlertDialogs.yesCanceldialog(
          context, 'Technical error. Please contact your Admin!');
      print('Exception raised while decryption');
    }
  }
}
