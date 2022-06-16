import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../utils/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    this.child,
    this.margin,
    this.isLoading = false,
  }) : super(key: key);

  factory CustomButton.info({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      color: CustomColors.primary,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomButton.success({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      color: CustomColors.success,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomButton.danger({
    required String text,
    required VoidCallback onTap,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      color: CustomColors.danger,
      margin: margin,
      onTap: onTap,
      isLoading: isLoading,
      child: child,
    );
  }

  factory CustomButton.inactive({
    required String text,
    Widget? child,
    EdgeInsets? margin,
    bool isLoading = false,
  }) {
    return CustomButton(
      text: text,
      color: CustomColors.grey,
      margin: margin,
      isLoading: isLoading,
      child: child,
      onTap: () {},
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
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : child ??
                Text(
                  text,
                  style: TextStyles.heading5SemiBold(
                    color: CustomColors.white,
                  ),
                ),
      ),
    );
  }
}
