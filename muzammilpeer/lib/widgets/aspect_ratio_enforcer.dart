import 'package:flutter/material.dart';

class AspectRatioEnforcer extends StatelessWidget {
  final double minWidth;
  final double minHeight;
  final double aspectRatio;
  final Widget child;

  AspectRatioEnforcer({
    required this.minWidth,
    required this.minHeight,
    required this.aspectRatio,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        // Enforce minimum width and height
        if (width < minWidth) {
          width = minWidth;
        }
        if (height < minHeight) {
          height = minHeight;
        }

        // Adjust dimensions to maintain aspect ratio
        if (width / height > aspectRatio) {
          width = height * aspectRatio;
        } else {
          height = width / aspectRatio;
        }

        return Center(
          child: Container(
            width: width,
            height: height,
            child: child,
          ),
        );
      },
    );
  }
}
