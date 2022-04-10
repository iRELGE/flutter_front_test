import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutterfronttest/common/core/GlobalStatic.dart';
import 'package:flutterfronttest/common/core/MediaQuery.dart';
import 'package:flutterfronttest/common/core/validation/text_field_validation.dart';
import 'package:flutterfronttest/common/models/user_authentification.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/bloc/auth_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserAuthentification userAuthentification = UserAuthentification("", "");
  void validatePressed() async {
    if (_formKey.currentState.validate()) {
      auth(userAuthentification, context);
    }
  }

  GoogleSignInAccount _userInfo;

  @override
  initState() {
    googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _userInfo = event;
      });
    });
    super.initState();
  }

  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              FlutterLogo(
                size: displayWidth(context) * 0.5,
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              TextFormField(
                onChanged: (value) {
                  if (mounted)
                    setState(() {
                      userAuthentification.userName = value;
                    });
                },
                validator: (value) =>
                    emptyValidation(value, "please enter your username"),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: "User Identification",
                    fillColor: Colors.grey),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              TextFormField(
                obscureText: obscureText,
                onChanged: (value) {
                  if (mounted)
                    setState(() {
                      userAuthentification.passWord = value;
                    });
                },
                validator: (value) =>
                    emptyValidation(value, "please enter your password"),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        if (mounted)
                          setState(() {
                            obscureText = !obscureText;
                          });
                      },
                    ),
                    border: OutlineInputBorder(),
                    labelText: "User Password"),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              ElevatedButton(
                  onPressed: () {
                    validatePressed();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: displayWidth(context),
                      child: Text("Sign in"))),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: displayWidth(context),
                      child: Text("Sign in whit google"))),
            ])));
  }
}

auth(UserAuthentification userAuthentification, BuildContext context) {
  context.read<AuthBloc>().add(AuthLoginEvent(userAuthentification));
}
