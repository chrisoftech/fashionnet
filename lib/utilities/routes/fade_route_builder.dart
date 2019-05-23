import 'package:flutter/material.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}

class FadeInAndOutRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget enterPage;
  final Widget exitPage;

  FadeInAndOutRouteBuilder({@required this.enterPage, @required this.exitPage})
      : super(
          pageBuilder: (context, animation1, animation2) => enterPage,
          transitionsBuilder: (context, animation1, animation2, child) {
            return Stack(
              children: <Widget>[
                FadeTransition(opacity: animation1, child: enterPage),
                FadeTransition(opacity: animation2, child: exitPage),
              ],
            );
          },
        );
}
