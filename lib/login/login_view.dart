import 'package:flutter/material.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel {
  final paddingLow = EdgeInsets.all(8.0);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        TextFormField(
          controller: controllerUsername,
          decoration: InputDecoration(
              labelText: 'Username', border: OutlineInputBorder()),
        ),
        TextFormField(
          controller: controllerPassword,
          decoration: InputDecoration(
              labelText: 'Password', border: OutlineInputBorder()),
        ),
        TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchUserLogin(controllerUsername.text, controllerPassword.text);
            }
          },
          child: Text("Login"),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            primary: Colors.white,
            backgroundColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
