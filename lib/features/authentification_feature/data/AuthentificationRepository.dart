import 'package:flutterfronttest/common/core/InjectionSharedRegistredType.dart';
import 'package:flutterfronttest/common/models/user_information.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/features/authentification_feature/data/store/iauthentification_remotestore.dart';
import 'package:flutterfronttest/features/authentification_feature/domain/iauthentification_repository.dart';

class AuthentificationRepository implements IAuthentificationRepository {
  final IAuthentificationRemoteStore authentificationRemoteStore;

  AuthentificationRepository(this.authentificationRemoteStore);
  @override
  Future<void> login(UserAuthentification userAuthentification) async {
    final userInfos =
        await authentificationRemoteStore.login(userAuthentification);
    InjectionSharedRegistredType.registerUserInfoTypes(userInfos);
  }
}
