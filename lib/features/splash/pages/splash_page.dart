import 'package:flutter/material.dart';

import '../../../authentication/authentication.dart';
import '../../../dependencies/dependencies.dart';

const String splashPageRoute = '/';

class SplashPage extends StatelessWidget {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authManager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
