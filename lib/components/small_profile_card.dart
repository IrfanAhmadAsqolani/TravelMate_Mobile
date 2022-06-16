import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/helpers/helpers.dart';

import '../gen/assets.gen.dart';
import '../utils/utils.dart';

class SmallProfileCard extends StatefulWidget {
  const SmallProfileCard({
    Key? key,
    this.name = '',
    this.imgUrl = '',
    this.time,
  }) : super(key: key);

  final String name;
  final String imgUrl;
  final DateTime? time;

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
                backgroundImage: NetworkImage(widget.imgUrl),
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
                widget.name,
                style: TextStyles.heading5Regular(),
              ),
              Text(
                DateHelper.getReadableDate(widget.time),
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
