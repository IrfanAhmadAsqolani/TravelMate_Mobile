import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO(Adityandar): fill with forgot password
      },
      child: Text(
        'Forgot Password?',
        style: TextStyles.heading7SemiBold(
          color: CustomColors.info,
        ),
      ),
    );
  }
}
