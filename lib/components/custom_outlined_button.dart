import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../utils/utils.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    this.child,
    this.margin,
    this.isLoading = false,
  }) : super(key: key);

  factory CustomOutlinedButton.info({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomOutlinedButton(
      text: text,
      color: CustomColors.info,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomOutlinedButton.success({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomOutlinedButton(
      text: text,
      color: CustomColors.success,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomOutlinedButton.danger({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomOutlinedButton(
      text: text,
      color: CustomColors.danger,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomOutlinedButton.inactive({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomOutlinedButton(
      text: text,
      color: CustomColors.grey,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  final String text;
  final Widget? child;
  final Color color;
  final EdgeInsets? margin;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: 1.sw,
        height: 56.w,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
          side: BorderSide(
            color: color,
          ),
        ),
        child: child ??
            Text(
              text,
              style: TextStyles.heading5SemiBold(
                color: color,
              ),
            ),
      ),
    );
  }
}
