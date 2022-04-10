import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfronttest/common/Widgets/custom_loader.dart';
import 'package:flutterfronttest/common/base_state.dart';
import 'package:flutterfronttest/common/Router/routes_captain.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/bloc/auth_bloc.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/pages/login_page.dart';
import 'package:flutterfronttest/features/home_feature/core/home_globalStatic.dart';

class AuthentificationBlockConsumerPage extends StatefulWidget {
  AuthentificationBlockConsumerPage({Key key}) : super(key: key);

  @override
  _AuthentificationBlockConsumerPageState createState() =>
      _AuthentificationBlockConsumerPageState();
}

class _AuthentificationBlockConsumerPageState
    extends State<AuthentificationBlockConsumerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          child: BlocConsumer<AuthBloc, BaseState>(listener: (context, state) {
            if (state is AuthUserAuthetifiedState) {
              RoutesCaptain.sailor.navigate(HomeGlobalStatic.homeRoute);
            }
          }, builder: (context, state) {
            if (state is AuthInitialState) {
              return LoginPage();
            }
            return CustomLoader();
          }),
        ));
  }
}
