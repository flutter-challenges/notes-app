import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double top;
  final double bottom;
  final double right;
  final double left;
  const CustomText({
    super.key,
    required this.title,
    this.top = 0,
    this.bottom = 0,
    this.right = 0,
    this.left = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: Text(title),
    );
  }
}
