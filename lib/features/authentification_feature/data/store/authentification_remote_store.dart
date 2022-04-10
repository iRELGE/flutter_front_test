import 'package:flutterfronttest/common/core/Services/fake_api_authentification/fake_api_authentification.dart';
import 'package:flutterfronttest/common/models/user_information.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/features/authentification_feature/data/store/iauthentification_remotestore.dart';

class AuthentificationRemoteStore implements IAuthentificationRemoteStore {
  @override
  Future<UserInformation> login(
      UserAuthentification userAuthentification) async {
    return await fakeApiAuthentification(userAuthentification);
  }
}
