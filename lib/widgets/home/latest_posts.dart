import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LatestPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Flexible(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            padding: EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return LatestPostItem(
                  postIndex: index == 0 ? 9 : index,
                  constraints: constraints,
                  deviceWidth: _deviceWidth);
            },
          );
        },
      ),
    );
  }
}
