import 'package:bloc/bloc.dart';
import 'package:flutterfronttest/common/base_state.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/features/authentification_feature/domain/UseCases/case_login.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, BaseState> {
  final CaseLogin caseLogin;
  AuthBloc(this.caseLogin) : super(AuthInitialState()) {
    on<AuthInitialEvent>((event, emit) {
      emit(AuthInitialState());
    });
    on<AuthLoginEvent>((event, emit) async {
      final resultOrFail = await caseLogin.call(event.userAuthentification);
      resultOrFail.fold((l) => emit(l.getFailureState()),
          (r) => emit(AuthUserAuthetifiedState()));
    });
  }
}
