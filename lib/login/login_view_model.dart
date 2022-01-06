import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_demo_flutter/core/auth_manager.dart';
import 'package:login_demo_flutter/core/cache_manager.dart';
import 'package:login_demo_flutter/home/home_view.dart';
import 'package:login_demo_flutter/login/model/user_request_model.dart';
import 'package:provider/provider.dart';

import './login.dart';
import 'service/login_service.dart';

abstract class LoginViewModel extends State<Login> with CacheManager {
  late final LoginService loginService;
  final _baseUrl = "http://10.0.3.2:8000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginService = LoginService(Dio(BaseOptions(baseUrl: _baseUrl)));
  }

  void fetchUserLogin(String username, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(username: username, password: password));

    if (response != null) {
      saveTokenId(response.token ?? '', response.userId.toString());
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomeView(),
    ));
  }
}
