import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt1;
import 'package:flutter/cupertino.dart';
import 'package:nps_app/Controllers/Encryption Controllers/randomkeygenerator.dart';
import '../../Model/alertModel/alert_dialog.dart';
import '../../config.properties' as config;

class DecryptName {
  late String decryptedname = '';
  Future<String> decryptName(String resp, BuildContext context) async {
    try {
      final encryptedRandomKey = encrypt1.Key.fromUtf8(digitKey);
      final iv = encrypt1.IV.fromUtf8(config.iv);
      final encrypter = encrypt1.Encrypter(
          encrypt1.AES(encryptedRandomKey, mode: encrypt1.AESMode.cbc));
      final decryptedRequest = resp;
      final decrypted = encrypter.decrypt64(decryptedRequest, iv: iv);
      final decryptedResponse = jsonDecode(decrypted);
      final decryptedStatus = jsonDecode(
          jsonEncode(decryptedResponse["resultInfo"]["resultStatus"]));
      final decryptedMsg =
          jsonDecode(jsonEncode(decryptedResponse["resultInfo"]["resultMsg"]));
      final resultMsg = (decryptedMsg.split(':'));
      if (decryptedStatus.contains('0')) {
        decryptedname = resultMsg[1];
      } else {
        decryptedname =
            await jsonDecode(jsonEncode(decryptedResponse["data"]["name"]));
      }
    } on Exception catch (_) {
      await AlertDialogs.yesCanceldialog(
          context, 'Technical error. Please contact your Admin!');
    } on RangeError catch (_) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    }
    return decryptedname;
  }
}
