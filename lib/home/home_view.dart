import 'package:flutter/material.dart';
import 'package:login_demo_flutter/core/auth_manager.dart';
import 'package:login_demo_flutter/core/cache_manager.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';

  late UserModel? userModel;

  void getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${userModel?.name}'),
      ),
      body: CircleAvatar(
        backgroundImage: NetworkImage(userModel?.ImageUrl ?? ''),
      ),
    );
  }
}
