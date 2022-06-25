import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../enums/enums.dart';
import '../helpers/common_helper.dart';
import '../utils/utils.dart';

class VerificationStatusInfo extends StatelessWidget {
  const VerificationStatusInfo({
    Key? key,
    required this.status,
  }) : super(key: key);

  final VerificationStatus status;

  @override
  Widget build(BuildContext context) {
    final message = CommonHelper.verificationStatusMessage(status);

    if (message == null) {
      return const SizedBox();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 8.w,
      ),
      width: 1.sw,
      color: CustomColors.grey,
      child: Text(
        message,
        style: TextStyles.heading7SemiBold(),
      ),
    );
  }
}
