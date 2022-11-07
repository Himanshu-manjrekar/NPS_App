// ignore_for_file: non_constant_identifier_names, duplicate_ignore
import '../../config.properties' as config;
import 'package:encrypt/encrypt.dart' as encrypt1;
import 'package:flutter/services.dart';
import 'package:nps_app/Controllers/Encryption Controllers/randomkeygenerator.dart';
import 'package:pointycastle/asymmetric/api.dart';

class EncryptRequest {
  Future<String> EncryptRandomKey() async {
    //  Encryption of Random Key Using RSA
    final publicPem = await rootBundle
        .loadString('assets/public_key.pem'); // Load public Key File
    final publicKey = encrypt1.RSAKeyParser().parse(publicPem)
        as RSAPublicKey; // parse it in publickey variable
    final plainText =
        digitKey; // Take Random 16 Digit Key in plainText to encrypt
    final encrypter = encrypt1.Encrypter(encrypt1.RSA(
      publicKey: publicKey,
    ));
    final encryptedRandomKey = encrypter.encrypt(plainText);
    return encryptedRandomKey.base64; // Return it
  }

  Future<String> EncryptPayload(String payload) async {
    final Payload = payload; // payload
    final EncryptedRandomKey = encrypt1.Key.fromUtf8(digitKey);
    final iv = encrypt1.IV.fromUtf8(config.iv);
    final encrypter = encrypt1.Encrypter(
        encrypt1.AES(EncryptedRandomKey, mode: encrypt1.AESMode.cbc));
    final encrypted = encrypter.encrypt(Payload, iv: iv);
    // print('Encrypted Payload :- ${encrypted.base64}');
    return encrypted.base64;
  }
}
