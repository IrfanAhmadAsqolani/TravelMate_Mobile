import 'package:flutter/material.dart';

import '../../../authentication/authentication.dart';
import '../../../dependencies/dependencies.dart';

const String splashPageRoute = '/';

class SplashPage extends StatelessWidget {
  Future<void> initializeSettings() async {
    Get.find<AuthenticationManager>().checkLoginStatus();

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
