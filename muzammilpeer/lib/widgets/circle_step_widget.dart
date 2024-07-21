import 'package:flutter/material.dart';

class CircleStepWidget extends StatelessWidget {
  final String contentText;

  const CircleStepWidget({super.key, required this.contentText});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Center(
      child: ClipOval(
        child: Container(
          width: 50, // Diameter = 2 * radius
          height: 50, // Diameter = 2 * radius
          color: Color(0xff3d48b1),
          child: Center(
            child: Text(
              contentText,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
