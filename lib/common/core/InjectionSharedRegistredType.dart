import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterfronttest/common/core/GlobalStatic.dart';

import 'package:flutterfronttest/common/core/Services/Store/GuidAnTokenStore/IGuidAndTokenStore.dart';
import 'package:flutterfronttest/common/core/Services/Store/GuidAnTokenStore/guidAndTokenStore.dart';
import 'package:flutterfronttest/common/core/infrastructure/persistance/cache_store.dart';
import 'package:flutterfronttest/common/core/infrastructure/persistance/icache_store.dart';
import 'package:flutterfronttest/common/models/user_information.dart';
import 'package:get_it/get_it.dart';

class InjectionSharedRegistredType {
  static Future<void> registerTypes(GetIt sl) async {
    sl.registerLazySingleton<IGuidAndTokenStore>(() => GuidAndTokenStore(sl()));

    sl.registerLazySingleton<ICacheStore>(() => CacheStore(sl()));
    sl.registerLazySingleton(() => const FlutterSecureStorage());

    // sl.registerLazySingleton(() => ApiClientGlobal(sl(), sl()));
  }

  static Future<void> registerUserInfoTypes(
      UserInformation userInformation) async {
    if (GlobalStatic.sl.isRegistered<UserInformation>()) {
      GlobalStatic.sl.unregister<UserInformation>();
    }
    GlobalStatic.sl
        .registerLazySingleton<UserInformation>(() => userInformation);
  }
}
