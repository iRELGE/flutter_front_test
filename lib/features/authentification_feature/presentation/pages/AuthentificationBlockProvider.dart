import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfronttest/common/core/GlobalStatic.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/bloc/auth_bloc.dart';
import 'AuthentificationBlockConsumerPage.dart';

class AuthentificationBlockProvider extends StatelessWidget {
  const AuthentificationBlockProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalStatic.sl<AuthBloc>()..add(AuthInitialEvent()),
      child: AuthentificationBlockConsumerPage(),
    );
  }
}
