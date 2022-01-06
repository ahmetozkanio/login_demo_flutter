import 'package:flutter/material.dart';
import 'package:login_demo_flutter/core/auth_manager.dart';
import 'package:login_demo_flutter/home/home_view.dart';
import 'package:login_demo_flutter/login/login.dart';
import 'package:provider/src/provider.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void controlToApp() async {
    await readAuthManager.fetchUserLogin();

    if (readAuthManager.isLogin) {
      await Future.delayed(
        Duration(seconds: 1),
      );
      readAuthManager.model = UserModel.fake();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
