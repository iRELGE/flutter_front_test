// ignore: import_of_legacy_library_into_null_safe
import 'package:sailor/sailor.dart';

class RoutesCaptain {
  static final sailor = Sailor();

  static void createRoutes(List<SailorRoute> routes) {
    sailor.addRoutes(routes);
  }
}
