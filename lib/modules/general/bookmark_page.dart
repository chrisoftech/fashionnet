import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;
    // final double _parentContentWidth =
    //     _deviceWidth * 0.90; // 90% of device width

    final double _parentContentPadding = (_deviceWidth * 0.10) /
        2; // 10% of device width divided by 2 to pad both sides

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          BookmarkedPost(
            deviceHeight: _deviceHeight,
            deviceWidth: _deviceWidth,
            parentContentPadding: _parentContentPadding,
          ),
        ],
      ),
    );
  }
}
