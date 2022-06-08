import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../../components/components.dart';
import '../widgets/widgets.dart';

class OnboardingInterestView extends StatelessWidget {
  const OnboardingInterestView({
    Key? key,
    required this.onContinueCallback,
  }) : super(key: key);

  final VoidCallback onContinueCallback;
  final bool ableToContinue = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 100.w),
              Text(
                'What are your interests?',
                style: TextStyles.heading1(),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: SizedBox(
              height: 250.w,
              width: 1.sw,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InterestOptionWidget(
                      title: 'Pantai',
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Gunung',
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Perkotaan',
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Danau',
                      isActive: true,
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Sungai',
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Taman Hiburan',
                      onTap: () {},
                    ),
                    InterestOptionWidget(
                      title: 'Museum',
                      isActive: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (ableToContinue)
                  ? CustomButton.info(
                      text: 'Continue',
                      onTap: onContinueCallback,
                    )
                  : CustomButton.inactive(
                      text: 'Continue',
                    ),
              SizedBox(height: 100.w),
            ],
          ),
        ),
      ],
    );
  }
}
