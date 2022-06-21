import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/helpers/helpers.dart';
import 'package:travelmate/models/authentication/authentication.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../authentication/authentication.dart';

const String registerPageRoute = '/register-page';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _identityNumberController =
      TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authManager = Get.find<AuthenticationManager>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100.w),
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
                controller: _usernameController,
                decoration: CustomInputDecoration.defaultDecoration('Username'),
                validator: ValidationHelper.emptyFormValidation,
              ),
              SizedBox(height: 6.w),
              TextFormField(
                controller: _nameController,
                decoration: CustomInputDecoration.defaultDecoration('Name'),
                validator: ValidationHelper.emptyFormValidation,
              ),
              SizedBox(height: 6.w),
              TextFormField(
                controller: _identityNumberController,
                decoration: CustomInputDecoration.defaultDecoration(
                  'Identity Number',
                ),
                validator: ValidationHelper.numberValidation,
              ),
              SizedBox(height: 6.w),
              TextFormField(
                controller: _contactNumberController,
                decoration: CustomInputDecoration.defaultDecoration(
                  'Contact Number',
                ),
                validator: ValidationHelper.numberValidation,
              ),
              SizedBox(height: 6.w),
              SizedBox(height: 6.w),
              TextFormField(
                controller: _passwordController,
                decoration: CustomInputDecoration.defaultDecoration('Password'),
                obscureText: true,
                validator: ValidationHelper.emptyFormValidation,
              ),
              SizedBox(height: 100.w),
              Obx(
                () => CustomButton.info(
                  text: 'Create Account',
                  margin: EdgeInsets.zero,
                  isLoading: authManager.isLoginLoading.value,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Get.find<AuthenticationManager>().register(
                        param: RegisterParam(
                          username: _usernameController.text,
                          fullName: _nameController.text,
                          identityNumber:
                              int.tryParse(_identityNumberController.text) ?? 0,
                          contactNumber:
                              int.tryParse(_contactNumberController.text) ?? 0,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                ),
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
      ),
    );
  }
}
