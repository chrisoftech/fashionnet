import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SuggestedPosts extends StatelessWidget {
  const SuggestedPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Suggested',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      final int postIndex = index == 0 ? 9 : index;

                      return PostItemCardSmall(postIndex: postIndex);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
