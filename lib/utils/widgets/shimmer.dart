import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerTextField extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final Color baseColor;
  final Color highlightColor;

  const CustomShimmerTextField({
    Key? key,
    required this.width,
    required this.height,
    this.hintText = 'Loading...',
    this.baseColor = const Color(0xFFCCCCCC),
    this.highlightColor = const Color(0xFFEEEEEE),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: TextField(
          enabled: false, // Disabled for shimmer effect
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: baseColor.withOpacity(0.6),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
