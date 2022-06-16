import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    Key? key,
    this.width,
    this.height,
    this.radius,
    this.margin,
  }) : super(key: key);

  const ShimmerContainer.square({
    Key? key,
    required double size,
    this.radius,
    this.margin,
  })  : width = size,
        height = size,
        super(key: key);

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEDEDED),
      highlightColor: const Color.fromARGB(255, 236, 229, 229),
      child: Container(
        width: width ?? 100.w,
        height: height ?? 100.w,
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          color: Colors.white,
        ),
      ),
    );
  }
}
