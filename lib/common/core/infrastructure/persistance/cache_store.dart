import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterfronttest/common/core/infrastructure/persistance/icache_store.dart';

import 'package:flutterfronttest/common/error/failure.dart';

class CacheStore implements ICacheStore {
  CacheStore(this.storage);

  final FlutterSecureStorage storage;

  @override
  Future<void> delete(String key) async {
    try {
      if (!await storage.containsKey(key: key)) return;

      await storage.delete(key: key);
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<bool> exists(String key) async {
    try {
      return await storage.containsKey(key: key);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    try {
      return await storage.write(key: key, value: json.encode(value));
    } catch (e) {
      throw CacheFailure();
    }
  }

  @override
  Future<T> getValue<T>(String key, {Function instantiator}) async {
    try {
      if (!await storage.containsKey(key: key)) throw CacheFailure();

      String value = await storage.read(key: key);
      var decoded = json.decode(value);

      return instantiator(decoded);
    } catch (e) {
      throw CacheFailure();
    }
  }
}
