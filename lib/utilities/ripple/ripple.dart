import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Duration animationDuration;
  final Rect rect;

  const Ripple({Key key, @required this.animationDuration, @required this.rect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rect == null
        ? Container()
        : AnimatedPositioned(
            duration: animationDuration,
            left: rect.left,
            right: MediaQuery.of(context).size.width - rect.right,
            top: rect.top,
            bottom: MediaQuery.of(context).size.height - rect.bottom,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                  ),
            ),
          );
  }
}
