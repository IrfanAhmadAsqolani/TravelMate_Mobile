import 'package:flutter/material.dart';
import 'package:travelmate/authentication/authentication_manager.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/register/pages/register_page.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../models/models.dart';

const String loginPageRoute = '/login-page';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final authManager = Get.find<AuthenticationManager>();
  bool isObscure = true;

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
              obscureText: isObscure,
              decoration: CustomInputDecoration.passwordInputDecoration(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                isObscure: isObscure,
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
                    param: LoginParam(
                      username: _usernameController.text,
                      password: _passwordController.text,
                    ),
                  );
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
