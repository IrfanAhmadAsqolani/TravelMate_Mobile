import 'package:flutter/material.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:travelmate/features/main_page/main_page.dart';

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
    return Scaffold(
      body: FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return Obx(() {
                return _authManager.isLogged.value ? MainPage() : LoginPage();
              });
            }
          }
        },
      ),
    );
  }
}
