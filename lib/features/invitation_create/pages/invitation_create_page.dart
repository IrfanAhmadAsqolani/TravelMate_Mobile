import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/visual/visual.dart';

const String invitationCreatePageRoute = '/invitation-create';

class InvitationCreatePage extends StatelessWidget {
  const InvitationCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.w),
            const CustomBackButton(),
            Padding(
              padding: EdgeInsets.only(left: 28.w, right: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26.w),
                  Text(
                    'Pantai Pangandaran',
                    style: TextStyles.heading7Regular(),
                  ),
                  SizedBox(height: 23.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration: CustomInputDecoration.formDecoration('Title'),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration: CustomInputDecoration.formDecoration('Date'),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration:
                          CustomInputDecoration.formDecoration('Person'),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration: CustomInputDecoration.formDecoration(
                          'Destination (Optional)'),
                    ),
                  ),
                  SizedBox(height: 8.w),
                  SizedBox(height: 8.w),
                  CustomButton.info(
                    text: 'Create',
                    onTap: () {},
                    margin: EdgeInsets.zero,
                  ),
                  SizedBox(height: 44.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
