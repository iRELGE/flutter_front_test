import 'dart:convert';

import 'package:flutter/foundation.dart';

enum LogLevel {
  Info, // tbarguigue professionel
  Warning, //erreur recuperable
  Error, //exception
  Fatal //excption irrecuperable
}

class LogItem {
  final StackTrace stackTrace;
  final String id; //deviceId-guid
  final LogLevel level;
  final String traceId;
  final DateTime date;
  final String feature;
  final String deviceId;
  final String message;
  final String environment;
  final String versionOs;
  final String deviceOs;
  final String applicationVersion;
  final String bloc;
  final String event;
  final String useCase;

  LogItem(
      this.id,
      this.level,
      this.traceId,
      this.date,
      this.feature,
      this.message,
      this.environment,
      this.deviceId,
      this.applicationVersion,
      this.versionOs,
      this.deviceOs,
      this.stackTrace,
      this.bloc,
      this.event,
      this.useCase);

  Map<String, dynamic> toMap() {
    return {
      'stackTrace': stackTrace.toString(),
      'id': id,
      'level': level.toString(),
      'traceId': traceId,
      'date': date.millisecondsSinceEpoch,
      'feature': feature,
      'deviceId': deviceId,
      'message': message,
      'environment': environment,
      'versionOs': versionOs,
      'deviceOs': deviceOs,
      'applicationVersion': applicationVersion,
      'bloc': bloc,
      'event': event,
      'useCase': useCase,
    };
  }

  String toJson() => json.encode(toMap());
}

class LogManager {
  static Future<void> exception(
    dynamic e,
    StackTrace stackTrace,
  ) async {
    if (kDebugMode) {
      print(stackTrace.toString());
    }
    return;
  }
}
