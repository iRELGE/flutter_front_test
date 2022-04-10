import 'package:flutter/material.dart';
import 'package:flutterfronttest/MainBootstrapper.dart';
import 'package:flutterfronttest/common/Router/routes_captain.dart';
import 'package:flutterfronttest/features/authentification_feature/Presentation/Pages/AuthentificationBlockProvider.dart';
import 'package:flutterfronttest/features/authentification_feature/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainBootstrapper.registerAllTypes();
  MainBootstrapper.setRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AuthentificationBlockProvider(),
      onGenerateRoute: RoutesCaptain.sailor.generator(),
      navigatorKey: RoutesCaptain.sailor.navigatorKey,
    );
  }
}
