import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        PostsFeed(),
      ],
    ));
  }
}
