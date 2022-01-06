import 'package:flutter/material.dart';
import 'package:login_demo_flutter/core/auth_manager.dart';

import 'package:login_demo_flutter/splash/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => AuthenticationManager(context: context),
        lazy: true,
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashView(),
    );
  }
}
