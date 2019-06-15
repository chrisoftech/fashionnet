import 'package:fashionnet/modules/modules.dart';
import 'package:flutter/material.dart';

class PostItemCardSmall extends StatelessWidget {
  final int postIndex;

  const PostItemCardSmall({Key key, @required this.postIndex})
      : super(key: key);

  int get _postIndex => postIndex;

  @override
  Widget build(BuildContext context) {
    final double _maxWidth = MediaQuery.of(context).size.width;

    final double _containerHeight = 150.0;

    final double _containerWidth =
        _maxWidth * 0.90; // 90% of total device width.

    final double _postContentContainerWidth =
        _maxWidth * 0.85; // 85% of total device width.
    final double _postImageContainerWidth =
        _maxWidth * 0.25; // 25% of total device width.

    final double _postContainerHeight = _containerHeight - 15.0;

    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PostDetailsPage()));
        },
        child: Container(
          height: _containerHeight,
          width: _containerWidth,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 15.0,
                bottom: 0.0,
                height: _postContainerHeight,
                width: _postContentContainerWidth,
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    padding: EdgeInsets.only(left: _maxWidth * 0.18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/temp2.jpg'),
                            ),
                            title: Text('John Doe'),
                            subtitle: Text('May 22, 2019'),
                            trailing: IconButton(
                              tooltip: 'Like this post',
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                print('post isFavorite');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Affordable Wears',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dolor purus, isaculis ac dolor nec, laoreet imperdiet eros.',
                                overflow: TextOverflow.ellipsis),
                            trailing: IconButton(
                              tooltip: 'Save this post',
                              icon: Icon(
                                Icons.bookmark_border,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                print('post isFavorite');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                height: _postContainerHeight,
                width: _postImageContainerWidth,
                child: Card(
                  elevation: 5.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/temp$_postIndex.jpg'))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
