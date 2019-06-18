import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _containerWidth =
        _deviceWidth > 550.0 ? 550.0 : _deviceWidth;

    final double _containerPaddingValue =
        (_deviceWidth > _containerWidth)
            ? (_deviceWidth - _containerWidth)
            : 0.0;
        // 10% of device width divided by 2 to pad both sides

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext contex, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PostItemCardSmall(postIndex: index),
                  ],
                );
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
