// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../Model/alertModel/alert_dialog.dart';
import 'package:nps_app/Controllers/Encryption Controllers/encryptrequest.dart';

class FetchNames {
  late int status = 0;
  final EncryptRequest _encryptRequest = EncryptRequest();
  late var decryptedResponse = '';

  Future<String?> fetchName(String uniqueId, BuildContext context) async {
    const baseurl =
        'https://investors-stage.pgimindiamf.com/api/v1/nontransaction/getName';
    final payload = '{"userId":"$uniqueId"}';
    final encryptedPayload = await _encryptRequest.EncryptPayload(payload);
    final encryptedDigitKey = await _encryptRequest.EncryptRandomKey();
    try {
      final response = await post(
        Uri.parse(baseurl),
        headers: {
          "EncryptionKey": encryptedDigitKey,
          "checkEnc": "true",
          "Content-Type": "application/json",
          "Cookie":
              "Path=/; visid_incap_2681643=GK4Nw+zpSOyI/11fy8bePvO79GIAAAAAQUIPAAAAAADe4FbGIiaX3sufnu5dpIzs; visid_incap_2681653=PdTk7fVcRU6TRuH8BXxAsPG79GIAAAAAQUIPAAAAAACPlhIDXYOUQu7e240YDvbx"
        },
        body: jsonEncode({"guid": "", "edata": encryptedPayload}),
      );

      if (response.statusCode == 200) {
        var encryptedResponse = jsonDecode(response.body);
        decryptedResponse = encryptedResponse["edata"];
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
        await AlertDialogs.yesCanceldialog(
            context, 'Technical Error. Please contact your Admin!');
      }
    } on SocketException catch (e) {
      // Navigator.of(context).pop();
      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      await AlertDialogs.yesCanceldialog(
          context, 'Please check your internet connection and try again.');
    } on Exception catch (e) {
      Navigator.of(context).pop();
      await AlertDialogs.yesCanceldialog(
          context, 'Technical Error. Please contact your Admin!');
    }
    return decryptedResponse;
  }
}
