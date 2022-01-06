import 'package:flutter/material.dart';

import 'package:login_demo_flutter/core/cache_manager.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  UserModel? model;

  void removeAllData() {
    isLogin = false;
    model = null;
  }

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}

class UserModel {
  String name;
  String ImageUrl;
  UserModel({
    required this.name,
    required this.ImageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
        name: "Ahmet Ozkan",
        ImageUrl: "https://avatars.githubusercontent.com/u/65506828?v=4");
  }
}
