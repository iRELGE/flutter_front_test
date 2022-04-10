import 'package:flutterfronttest/features/authentification_feature/Core/AuthentificationGlobalStatic.dart';
import 'package:flutterfronttest/features/authentification_feature/Data/AuthentificationRepository.dart';
import 'package:flutterfronttest/features/authentification_feature/Presentation/Pages/AuthentificationBlockProvider.dart';
import 'package:flutterfronttest/features/authentification_feature/data/store/authentification_remote_store.dart';
import 'package:flutterfronttest/features/authentification_feature/data/store/iauthentification_remotestore.dart';
import 'package:flutterfronttest/features/authentification_feature/domain/UseCases/case_login.dart';
import 'package:flutterfronttest/features/authentification_feature/domain/iauthentification_repository.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sailor/sailor.dart';

class AuthentificationBootstrapper {
  static Future<void> registerTypes(GetIt sl) async {
    //feature
    sl.registerFactory(
      () => AuthBloc(sl()),
    );
    //usecase

    sl.registerLazySingleton(() => CaseLogin(sl()));
    //repo
    sl.registerLazySingleton<IAuthentificationRepository>(
        () => AuthentificationRepository(sl()));
    //store
    sl.registerLazySingleton<IAuthentificationRemoteStore>(
        () => AuthentificationRemoteStore());
  }

  static SailorRoute sailorRoute() {
    return SailorRoute(
      name: AuthentificationGlobalStatic.authentificationRoute,
      builder: (context, args, params) {
        return AuthentificationBlockProvider();
      },
    );
  }
}
