import 'package:flutter/material.dart';

class PostFormCarousel extends StatelessWidget {
  const PostFormCarousel({
    Key key,
    @required this.deviceHeight,
    @required this.deviceWidth,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 300.0,
      width: deviceWidth,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/avatars/ps-avatar.png'),
          ),
        ),
      ),
    );
  }
}