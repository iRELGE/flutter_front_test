import 'package:flutterfronttest/common/Router/routes_captain.dart';
import 'package:flutterfronttest/common/core/GlobalStatic.dart';
import 'package:flutterfronttest/common/core/InjectionSharedRegistredType.dart';
import 'package:flutterfronttest/features/authentification_feature/AuthentificationBootstrapper.dart';
import 'package:flutterfronttest/features/home_feature/HomeBootstrapper.dart';

class MainBootstrapper {
  static Future<void> registerAllTypes() async {
    final sl = GlobalStatic.sl;
    InjectionSharedRegistredType.registerTypes(sl);
    AuthentificationBootstrapper.registerTypes(sl);
  }

  static void setRoutes() {
    RoutesCaptain.createRoutes([
      AuthentificationBootstrapper.sailorRoute(),
      HomeBootstrapper.sailorRoute()
    ]);
  }
}
