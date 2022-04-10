import 'package:flutter/material.dart';

@immutable
abstract class BaseState {
  const BaseState();
}

class CacheFailureState extends BaseState {}

class DioFailureUncorrectCredState extends BaseState {
  final String message;
  final int statutCode;

  const DioFailureUncorrectCredState(this.message, this.statutCode);
}

class IgnoreState extends BaseState {}
