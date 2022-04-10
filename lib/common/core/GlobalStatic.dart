import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GlobalStatic {
  static final String CACHED_TOKEN = "token";
  static final String CACHED_GUID = "guid";
  static final String CACHED_GLOBAL_SETTING = "global-setting";
  static final String AUTHENTIFICATION_CONFIG_FILE =
      "authentication_config.json";

  static final String USER_INFORMATIONS_CONFIG_FILE = "user_information.json";

  static final Iterable<Locale> supportedLocales = [
    Locale('fr', 'FR'),
    Locale('ar', 'AR'),
  ];

  static final sl = GetIt.instance;
}

final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
