import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';
import 'package:travelmate/utils/utils.dart';

const String registerPageRoute = '/register-page';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 171.w),
            Text(
              'Create account',
              style: TextStyles.heading1(),
            ),
            SizedBox(height: 16.w),
            Text(
              'Dare to live the life you’re always wanted.\nIt start from here.',
              textAlign: TextAlign.center,
              style: TextStyles.heading5Regular(
                color: CustomColors.darkGrey.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 48.w),
            TextFormField(
              decoration: CustomInputDecoration.defaultDecoration('Name'),
            ),
            SizedBox(height: 6.w),
            TextFormField(
              decoration: CustomInputDecoration.defaultDecoration('Email'),
            ),
            SizedBox(height: 6.w),
            TextFormField(
              decoration: CustomInputDecoration.defaultDecoration('Password'),
            ),
            SizedBox(height: 178.w),
            CustomButton.info(
              text: 'Create Account',
              margin: EdgeInsets.zero,
              onTap: () {
                // TODO(adityandar): change to logic of register
                Get.offNamedUntil(onboardingPageRoute, (route) => false);
              },
            ),
            SizedBox(height: 32.w),
            RowTextButton(
              text: 'Already have an account?',
              textOnButton: 'Sign In',
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
