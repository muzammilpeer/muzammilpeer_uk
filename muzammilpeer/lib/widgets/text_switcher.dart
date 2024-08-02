import 'package:flutter/material.dart';

class TextSwitcher extends StatefulWidget {
  @override
  _TextSwitcherState createState() => _TextSwitcherState();
}

class _TextSwitcherState extends State<TextSwitcher> {
  int _index = 0;
  final List<String> _texts = [
    'Engineering Lead ',
    'Software Engineer',
    'Mobile Developer ',
    'Flutter Expert   ',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _index = (_index + 1) % _texts.length;
      });
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isWideScreen = constraints.maxWidth > 600;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Align(
              alignment: isWideScreen ? Alignment.topLeft : Alignment.topLeft,
              key: ValueKey<int>(_index),
              child: Text(
                _texts[_index],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      );
    });
  }
}
