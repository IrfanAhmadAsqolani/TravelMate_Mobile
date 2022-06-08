import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../../components/components.dart';
import '../../../../gen/assets.gen.dart';

class OnboardingUploadKTPView extends StatefulWidget {
  const OnboardingUploadKTPView({
    Key? key,
    required this.onContinueCallback,
  }) : super(key: key);

  final VoidCallback onContinueCallback;

  @override
  State<OnboardingUploadKTPView> createState() =>
      _OnboardingUploadKTPViewState();
}

class _OnboardingUploadKTPViewState extends State<OnboardingUploadKTPView> {
  String imagePhotoUrl = '';

  @override
  Widget build(BuildContext context) {
    if (imagePhotoUrl.isNotEmpty) {
      return SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100.w),
                  Text(
                    'One step closer ...',
                    style: TextStyles.heading1(),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                Assets.images.imgKtpNotFound.path,
                width: 254.w,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton.info(
                    text: 'Continue',
                    onTap: widget.onContinueCallback,
                  ),
                  SizedBox(height: 15.w),
                  CustomOutlinedButton.info(
                    text: 'Retake',
                    onTap: () {},
                  ),
                  SizedBox(height: 30.w),
                ],
              ),
            )
          ],
        ),
      );
    }
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'One step closer ...',
            style: TextStyles.heading1(),
          ),
          SizedBox(height: 19.w),
          Text(
            'We need your data verification.\n'
            'This aims to maximize the safety of fellow travelers',
            textAlign: TextAlign.center,
            style: TextStyles.heading5Regular(
              color: CustomColors.darkGrey.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 32.w),
          Image.asset(
            Assets.images.imgKtpExample.path,
            width: 239.w,
          ),
          SizedBox(height: 27.w),
          Text(
            'it should be like this',
            style: TextStyles.heading5Regular(
              color: CustomColors.darkGrey.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 70.w),
          CustomButton.info(
            text: 'Upload ID Card',
            onTap: () {
              // TODO(adityandar): integrate with FilePicker
              imagePhotoUrl = 'aaaa';
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
