import 'dart:math';

String generateRandomString() {
  const characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random();
  final length = 6;
  String result = '#';

  for (var i = 0; i < length; i++) {
    final index = random.nextInt(characters.length);
    result += characters[index];
  }

  return result;
}