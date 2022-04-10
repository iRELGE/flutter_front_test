import 'package:flutterfronttest/common/core/GlobalStatic.dart';
import 'package:flutterfronttest/common/core/infrastructure/persistance/icache_store.dart';

import 'IGuidAndTokenStore.dart';

class GuidAndTokenStore implements IGuidAndTokenStore {
  GuidAndTokenStore(this.localStorageCacheStore);

  final ICacheStore localStorageCacheStore;

  @override
  Future<String> getToken() async {
    return await localStorageCacheStore
        .getValue<String>(GlobalStatic.CACHED_TOKEN);
  }

  @override
  Future<void> removeTokenSourceData() async {
    return localStorageCacheStore.delete(GlobalStatic.CACHED_TOKEN);
  }

  @override
  Future<void> saveToken(String token) async {
    if (await localStorageCacheStore.exists(GlobalStatic.CACHED_GUID)) {
      await localStorageCacheStore.delete(GlobalStatic.CACHED_GUID);
    }
    return await localStorageCacheStore.setValue(
        GlobalStatic.CACHED_TOKEN, token);
  }
}
