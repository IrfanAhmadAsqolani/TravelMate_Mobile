import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: widget.user?.pictImageUrl ?? '',
          width: 40.w,
          height: 40.w,
          errorWidget: (_, __, ___) {
            return CircleAvatar(
              radius: 40.w,
              backgroundImage: AssetImage(
                Assets.images.imgPersonDefault.path,
              ),
            );
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
