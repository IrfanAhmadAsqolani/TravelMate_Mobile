import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/helpers/helpers.dart';

import '../gen/assets.gen.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class SmallProfileCard extends StatefulWidget {
  const SmallProfileCard({
    Key? key,
    this.user,
  }) : super(key: key);

  final UserMdl? user;

  @override
  State<SmallProfileCard> createState() => _SmallProfileCardState();
}

class _SmallProfileCardState extends State<SmallProfileCard> {
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isError
            ? CircleAvatar(
                radius: 20.w,
                backgroundImage: AssetImage(
                  Assets.images.imgPersonDefault.path,
                ),
              )
            : CircleAvatar(
                radius: 20.w,
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
                style: TextStyles.heading5Regular(),
              ),
              Text(
                DateHelper.getReadableDate(widget.user?.createdAt),
                style: TextStyles.heading7Regular(
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
