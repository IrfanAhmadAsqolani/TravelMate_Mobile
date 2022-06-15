import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/visual/visual.dart';

import '../../../components/components.dart';

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
            const CenterTitleWithBack(
              title: 'Create Invitation',
            ),
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
                    height: 41.w,
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                      color: CustomColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: DateTimePicker(
                      decoration:
                          CustomInputDecoration.formDecoration("Date").copyWith(
                        contentPadding: EdgeInsets.all(10.w),
                      ),
                      initialValue: 'Date',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val),
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      Container(
                        width: 146.w,
                        decoration: BoxDecoration(
                          boxShadow: Shadows.defaultShadow(),
                        ),
                        child: TextFormField(
                          decoration: CustomInputDecoration.formDecoration('5'),
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Text(
                        'Person',
                        style: TextStyles.heading5Regular(),
                      )
                    ],
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration: CustomInputDecoration.formDecoration(
                          'Description (Optional)'),
                      maxLines: null,
                      minLines: 2,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: Shadows.defaultShadow(),
                    ),
                    child: TextFormField(
                      decoration: CustomInputDecoration.formDecoration(
                          'WhatsApp Group Link'),
                    ),
                  ),
                  SizedBox(height: 30.w),
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
