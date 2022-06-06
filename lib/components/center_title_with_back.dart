import 'package:flutter/material.dart';
import 'package:travelmate/utils/utils.dart';

import '../dependencies/dependencies.dart';
import '../gen/assets.gen.dart';

class CenterTitleWithBack extends StatelessWidget {
  const CenterTitleWithBack({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyles.heading4(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 27.w),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              Assets.icons.icChevronLeft,
              width: 24.w,
            ),
          ),
        ),
      ],
    );
  }
}
