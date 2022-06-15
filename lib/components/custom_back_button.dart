import 'package:flutter/material.dart';

import '../dependencies/dependencies.dart';
import '../gen/assets.gen.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 27.w),
      child: InkWell(
        onTap: () {
          Get.back();
          print("aaa");
        },
        child: SvgPicture.asset(
          Assets.icons.icChevronLeft,
          width: 24.w,
        ),
      ),
    );
  }
}