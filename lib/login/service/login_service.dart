import 'package:dio/dio.dart';
import 'package:login_demo_flutter/login/model/user_request_model.dart';
import 'dart:io';

import 'package:login_demo_flutter/login/model/user_response_model.dart';

abstract class ILoginSevice {
  final String path = '/api/api-token-auth/';

  ILoginSevice(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);
  final Dio dio;
}

class LoginService extends ILoginSevice {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(path, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return UserResponseModel.fromJson(response.data);
    }
    return null;
  }
}
