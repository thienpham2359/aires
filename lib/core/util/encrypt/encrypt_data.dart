//for AES Algorithms
import 'package:encrypt/encrypt.dart';

class EncryptData {
  static const KEY = "RKDGf10ELv0wJ1MdskhiA03nyTp6wHQL";

  static Encrypted? encrypted;
  static var decrypted;

  static String encryptAES(plainText) {
    final key = Key.fromUtf8(KEY);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted!.base64);
    return encrypted!.base64;
  }

  static String decryptAES(plainText) {
    final key = Key.fromUtf8(KEY);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    return decrypted;
  }
}
