import 'package:flutter/material.dart';

import '../utils/utils.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({
    Key? key,
    required this.text,
    required this.textOnButton,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String textOnButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$text ',
          style: TextStyles.heading5Regular(
            color: CustomColors.grey,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textOnButton,
            style: TextStyles.heading5SemiBold(
              color: CustomColors.info,
            ),
          ),
        )
      ],
    );
  }
}
