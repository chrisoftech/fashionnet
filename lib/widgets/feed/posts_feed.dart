import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostsFeed extends StatelessWidget {
  final List<String> _imageUrls = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PostItemCardDefault(
            postImages: _imageUrls,
          );
        },
        childCount: 10,
      ),
    );
  }
}
