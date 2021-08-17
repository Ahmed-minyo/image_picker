import 'dart:core';
import 'package:task/helper/enumeration.dart';

abstract class LocalDataManager {
  Future<bool> writeData(CachingKey key, dynamic value);

  Future<bool> removeData(CachingKey key);
  Future<String> readString(CachingKey key);
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);

  static const CachingKey IMAGES = const CachingKey('IMAGES');
}
