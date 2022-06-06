import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../utils/utils.dart';

class StoryBook extends StatelessWidget {
  const StoryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton.info(
              text: 'Sign In',
              onTap: () {},
            ),
            SizedBox(height: 5.w),
            CustomButton.inactive(
              text: 'Requested',
              onTap: () {},
            ),
            SizedBox(height: 5.w),
            CustomButton.danger(
              text: 'Not Available',
              onTap: () {},
            ),
            SizedBox(height: 5.w),
            CustomButton.success(
              text: '',
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Join Group',
                    style: TextStyles.heading5SemiBold(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.w),
            CustomOutlinedButton.info(
              text: 'Retake',
              onTap: () {},
            ),
            SizedBox(height: 5.w),
            InvitationCard(
              title: 'Touring Santai',
              date: DateTime.now(),
              creator: 'Cameron Steward',
              number: 10,
              onTap: () {},
            ),
            SizedBox(height: 5.w),
            InvitationCard(
              title: 'Touring Santai',
              date: DateTime.now(),
              creator: 'Cameron Steward',
              number: 10,
              isOpen: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
