import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/invitation_create/controller/invitation_create_controller.dart';
import 'package:travelmate/utils/visual/visual.dart';

import '../../../components/components.dart';
import '../../../helpers/validation_helper.dart';
import '../../../models/destinations/destination_mdl.dart';
import '../../../models/models.dart';
import '../../../network/network.dart';

const String invitationCreatePageRoute = '/invitation-create';

class InvitationCreatePage extends StatefulWidget {
  InvitationCreatePage({Key? key}) : super(key: key);

  @override
  State<InvitationCreatePage> createState() => _InvitationCreatePageState();
}

class _InvitationCreatePageState extends State<InvitationCreatePage> {
  final destination = Get.arguments as DestinationMdl;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _personController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _waController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final InvitationCreateController _invitationCreateController =
      Get.put(InvitationCreateController());

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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 26.w),
                    Text(
                      destination.name ?? '',
                      style: TextStyles.heading7Regular(),
                    ),
                    SizedBox(height: 23.w),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: Shadows.defaultShadow(),
                      ),
                      child: TextFormField(
                        controller: _titleController,
                        decoration:
                            CustomInputDecoration.formDecoration('Title'),
                        validator: ValidationHelper.emptyFormValidation,
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
                        controller: _dateController,
                        decoration: CustomInputDecoration.formDecoration("Date")
                            .copyWith(
                          contentPadding: EdgeInsets.all(10.w),
                        ),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (val) => print(val),
                        validator: ValidationHelper.emptyFormValidation,
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
                            controller: _personController,
                            decoration:
                                CustomInputDecoration.formDecoration('5'),
                            validator: ValidationHelper.emptyFormValidation,
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
                        controller: _descController,
                        decoration: CustomInputDecoration.formDecoration(
                            'Description (Optional)'),
                        maxLines: null,
                        minLines: 2,
                        validator: ValidationHelper.emptyFormValidation,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: Shadows.defaultShadow(),
                      ),
                      child: TextFormField(
                        controller: _waController,
                        decoration: CustomInputDecoration.formDecoration(
                            'WhatsApp Group Link'),
                        validator: ValidationHelper.emptyFormValidation,
                      ),
                    ),
                    SizedBox(height: 30.w),
                    CustomButton.info(
                      text: 'Create',
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _invitationCreateController.invitationCreate(
                            param: InvitationCreateParam(
                              title: _titleController.text,
                              date: _dateController.text,
                              person: int.tryParse(_personController.text) ?? 0,
                              desc: _descController.text,
                              wa: _waController.text,
                              destinationId: destination.id ?? 0,
                              ownerId: 0,
                            ),
                          );
                        }
                      },
                      margin: EdgeInsets.zero,
                    ),
                    SizedBox(height: 44.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
