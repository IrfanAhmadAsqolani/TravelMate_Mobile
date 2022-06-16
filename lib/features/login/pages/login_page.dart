import 'package:flutter/material.dart';
import 'package:travelmate/authentication/authentication_manager.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/register/pages/register_page.dart';
import 'package:travelmate/utils/utils.dart';

import 'widgets/widgets.dart';

const String loginPageRoute = '/login-page';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authManager = Get.find<AuthenticationManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 171.w),
            Text(
              'Login',
              style: TextStyles.heading1(),
            ),
            SizedBox(height: 16.w),
            Text(
              'Welcome,\nSign in to continue',
              textAlign: TextAlign.center,
              style: TextStyles.heading5Regular(
                color: CustomColors.darkGrey.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 48.w),
            TextFormField(
              controller: _usernameController,
              decoration: CustomInputDecoration.defaultDecoration('Username'),
            ),
            SizedBox(height: 6.w),
            TextFormField(
              controller: _passwordController,
              decoration:
                  CustomInputDecoration.defaultDecoration('Password').copyWith(
                suffix: const ForgotPasswordButton(),
              ),
            ),
            SizedBox(height: 238.w),
            Obx(
              () => CustomButton.info(
                text: 'Sign In',
                margin: EdgeInsets.zero,
                isLoading: authManager.isLoginLoading.value,
                onTap: () {
                  Get.find<AuthenticationManager>().signIn(
                    username: _usernameController.text,
                    password: _passwordController.text,
                  );
                  // Get.offNamedUntil(mainPageRoute, (route) => false);
                },
              ),
            ),
            SizedBox(height: 32.w),
            RowTextButton(
              text: "Don't have an account?",
              textOnButton: 'Create Account',
              onTap: () {
                Get.toNamed(registerPageRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
