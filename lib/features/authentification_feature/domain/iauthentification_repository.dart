import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/common/models/user_information.dart';

abstract class IAuthentificationRepository {
  Future<void> login(UserAuthentification userAuthentification);
}
