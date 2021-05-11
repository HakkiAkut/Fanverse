import 'dart:math';

class RandomGenerator{
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))))+ DateTime.now().toIso8601String();
  int getRandomInt(int limit) => _rnd.nextInt(limit);
}
