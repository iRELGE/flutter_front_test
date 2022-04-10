import 'package:flutterfronttest/features/home_feature/core/home_globalStatic.dart';
import 'package:flutterfronttest/features/home_feature/homePage.dart';
import 'package:sailor/sailor.dart';

class HomeBootstrapper {
  static SailorRoute sailorRoute() {
    return SailorRoute(
      name: HomeGlobalStatic.homeRoute,
      builder: (context, args, params) {
        return HomePage();
      },
    );
  }
}
