// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:math';

class KeyGenerator {
  // ignore: non_constant_identifier_names
  String RandomKey() {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    int length = 16;
    Random random = Random();
    final key = String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    return key;
  }

  late String digitKey = RandomKey();
}

var key = KeyGenerator();
final digitKey = key.digitKey;
