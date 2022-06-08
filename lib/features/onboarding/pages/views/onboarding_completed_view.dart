import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../../gen/assets.gen.dart';

class OnboardingCompletedView extends StatelessWidget {
  const OnboardingCompletedView({
    Key? key,
    required this.onContinueCallback,
  }) : super(key: key);

  final VoidCallback onContinueCallback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Uploaded',
                  style: TextStyles.heading1(),
                ),
                SizedBox(height: 45.w),
                Image.asset(
                  Assets.images.imgSuccess.path,
                  width: 120.w,
                ),
                SizedBox(height: 45.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'The verification process will take a maximum of 24 hours. You still can use the app while waiting.',
                    textAlign: TextAlign.center,
                    style: TextStyles.heading5Regular(
                      color: CustomColors.darkGrey.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton.info(
                  text: 'Continue',
                  onTap: onContinueCallback,
                ),
                SizedBox(height: 50.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
