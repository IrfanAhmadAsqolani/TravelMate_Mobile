import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/features/register/pages/register_page.dart';
import 'package:travelmate/utils/utils.dart';

import 'widgets/widgets.dart';

const String loginPageRoute = '/login-page';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              decoration: CustomInputDecoration.defaultDecoration('Email'),
            ),
            SizedBox(height: 6.w),
            TextFormField(
              decoration:
                  CustomInputDecoration.defaultDecoration('Password').copyWith(
                suffix: const ForgotPasswordButton(),
              ),
            ),
            SizedBox(height: 238.w),
            CustomButton.info(
              text: 'Sign In',
              margin: EdgeInsets.zero,
              onTap: () {
                // TODO(adityandar): change to logic of login
                Get.offNamedUntil(mainPageRoute, (route) => false);
              },
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
