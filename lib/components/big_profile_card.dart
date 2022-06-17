import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/gen/assets.gen.dart';
import 'package:travelmate/models/models.dart';

import '../helpers/helpers.dart';
import '../utils/utils.dart';

class BigProfileCard extends StatefulWidget {
  const BigProfileCard({
    Key? key,
    this.user,
  }) : super(key: key);

  final UserMdl? user;

  @override
  State<BigProfileCard> createState() => _BigProfileCardState();
}

class _BigProfileCardState extends State<BigProfileCard> {
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isError
            ? CircleAvatar(
                radius: 40.w,
                backgroundImage: AssetImage(
                  Assets.images.imgPersonDefault.path,
                ),
              )
            : CircleAvatar(
                radius: 40.w,
                backgroundImage: NetworkImage(widget.user?.pictImageUrl ?? ''),
                backgroundColor: Colors.transparent,
                onBackgroundImageError: (_, __) {
                  isError = true;
                  setState(() {});
                },
              ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user?.fullName ?? '',
                style: TextStyles.heading4(),
              ),
              Text(
                DateHelper.getReadableDate(widget.user?.createdAt),
                style: TextStyles.heading6(
                  color: CustomColors.darkGrey.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
