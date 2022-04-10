import 'dart:convert';

import 'package:flutter/services.dart';

class ConfigReader {
  static Future<String> initialize(String configFile) async {
    return await rootBundle.loadString('assets/config/$configFile');
  }
}
