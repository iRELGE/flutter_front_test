abstract class ICacheStore {
  Future<bool> exists(String key);

  Future<void> setValue<T>(String key, T value);

  Future<T> getValue<T>(String key, {Function instantiator});

  Future<void> delete(String key);
}
