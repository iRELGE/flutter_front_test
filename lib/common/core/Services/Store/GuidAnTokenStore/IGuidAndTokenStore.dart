abstract class IGuidAndTokenStore {
  Future<void> saveToken(String token);

  Future<String> getToken();

  Future<void> removeTokenSourceData();
}
