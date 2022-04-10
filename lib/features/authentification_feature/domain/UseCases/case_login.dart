import 'package:flutterfronttest/common/core/Usecase.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/features/authentification_feature/domain/iauthentification_repository.dart';

class CaseLogin extends UseCase<void, UserAuthentification> {
  final IAuthentificationRepository authentificationRepository;

  CaseLogin(this.authentificationRepository);
  @override
  Future<void> exec(UserAuthentification params) async {
    return await authentificationRepository.login(params);
  }
}
