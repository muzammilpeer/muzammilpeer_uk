import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTimeWidget extends StatelessWidget {
  final Stream<String> _timeStream = Stream.periodic(
    Duration(seconds: 1),
    (_) => _formatDateTime(DateTime.now()),
  );

  static String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return StreamBuilder<String>(
      stream: _timeStream,
      initialData: _formatDateTime(DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: _textTheme.headlineMedium,
          );
        } else {
          return Text(
            'Loading...',
            style:  _textTheme.headlineMedium,
          );
        }
      },
    );
  }
}
