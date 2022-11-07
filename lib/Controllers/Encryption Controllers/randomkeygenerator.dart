import 'dart:math';
import '../../config.properties' as config;

class KeyGenerator {
  String randomKey() {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random random = Random();
    final key = String.fromCharCodes(Iterable.generate(config.randomKeyLength,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    return key;
  }

  late String digitKey = randomKey();
}

var key = KeyGenerator();
final digitKey = key.digitKey;
