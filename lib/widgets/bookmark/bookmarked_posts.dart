import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookmarkedPost extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final double parentContentPadding;

  const BookmarkedPost(
      {Key key,
      @required this.deviceHeight,
      @required this.deviceWidth,
      @required this.parentContentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext contex, int index) {
          return _buildBookmarkBody(
              deviceheight: deviceHeight,
              deviceWidth: deviceWidth,
              parentContentPadding: parentContentPadding);
        },
        childCount: 10,
      ),
    );
  }

  Widget _buildBookmarkBody(
      {@required double deviceheight,
      @required double deviceWidth,
      @required double parentContentPadding}) {
    return Container(
      height: deviceheight,
      width: deviceWidth,
      child: Column(
        children: <Widget>[
          Flexible(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: parentContentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Bookmarked Posts (50 records)',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return PostItemCardSmall(postIndex: index);
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
