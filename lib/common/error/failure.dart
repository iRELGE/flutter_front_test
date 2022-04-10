import 'package:flutterfronttest/common/base_state.dart';

abstract class Failure {
  BaseState getFailureState();
}

class CacheFailure extends Failure {
  @override
  getFailureState() => CacheFailureState();
}

class DioFailureUncorrectCred extends Failure {
  final String message;
  final int statutCode;

  DioFailureUncorrectCred(this.message, this.statutCode);
  @override
  getFailureState() => DioFailureUncorrectCredState(message, statutCode);
}

class IgnoreFailure extends Failure {
  @override
  BaseState getFailureState() => IgnoreState();
}
