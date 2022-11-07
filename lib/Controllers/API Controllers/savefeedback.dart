// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:nps_app/Model/alertModel/feedback_alert.dart';
import 'package:nps_app/Model/alertModel/technicalerror_dailog.dart';
import '../../Model/alertModel/alert_dialog.dart';
import 'package:nps_app/Controllers/Encryption Controllers/encryptrequest.dart';
import '../API Controllers/config.properties' as config;

class SaveFeedback {
  late int status = 0;
  final EncryptRequest _encryptRequest = EncryptRequest();
  late var finalresponse = '';

  Future<String> saveFeedback(
    String uniqueId,
    int? rating,
    String comments,
    String source,
    BuildContext context,
  ) async {
    final baseurl = config.baseurl;
    final endpoint = config.savefeedbackEndpoint;
    final url = baseurl + endpoint;
    final payload =
        '{"identifier":"$uniqueId","ratings":$rating,"comment":"$comments","source":"$source"}';
    final encryptedPayload = await _encryptRequest.EncryptPayload(payload);
    final encryptedDigitKey = await _encryptRequest.EncryptRandomKey();
    try {
      final response = await post(
        Uri.parse(url),
        headers: {
          "EncryptionKey": encryptedDigitKey,
          "checkEnc": "true",
          "Content-Type": "application/json",
          "Cookie":
              "Path=/; visid_incap_2681643=GK4Nw+zpSOyI/11fy8bePvO79GIAAAAAQUIPAAAAAADe4FbGIiaX3sufnu5dpIzs; visid_incap_2681653=PdTk7fVcRU6TRuH8BXxAsPG79GIAAAAAQUIPAAAAAACPlhIDXYOUQu7e240YDvbx"
        },
        body: jsonEncode({"guid": "", "edata": encryptedPayload}),
      );
      status = response.statusCode;
      if (status == 200) {
        var encryptedResponse = jsonDecode(response.body);
        finalresponse = encryptedResponse['edata'];
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
        await TechnicalAlertDialogs.yesCanceldialog(
            context, 'Technical Error. Please contact your Admin!');
      }
    } on SocketException catch (e) {
      await FeedbackAlerts.yesCanceldialog(
          context, 'Please check your internet connection and try again.');
      Navigator.of(context).pop();
    } on Exception catch (e) {
      await TechnicalAlertDialogs.yesCanceldialog(
          context, 'Technical Error. Please contact your Admin!');
      Navigator.of(context).pop();
    }
    return finalresponse;
  }
}
