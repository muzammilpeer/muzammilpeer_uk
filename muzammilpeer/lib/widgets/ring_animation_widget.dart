import 'package:flutter/material.dart';

class RingAnimationWidget extends StatefulWidget {
  final Widget child;

  const RingAnimationWidget({Key? key, required this.child}) : super(key: key);

  @override
  _RingAnimationWidgetState createState() => _RingAnimationWidgetState();
}

class _RingAnimationWidgetState extends State<RingAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _shakeAnimation = Tween(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );

    _rotateAnimation = Tween(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(_shakeAnimation.value, 0, 0)
            ..rotateZ(_rotateAnimation.value),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
