import 'package:flutter/material.dart';

class PostItemCardLarge extends StatelessWidget {
  const PostItemCardLarge({
    Key key,
    @required this.postIndex,
    @required this.constraints,
    @required this.deviceWidth,
  }) : super(key: key);

  final int postIndex;
  final BoxConstraints constraints;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    final double _maxHeight = constraints.maxHeight;

    final double _parentContainerWidth =
        deviceWidth * 0.90; // 80% of device width

    final double _postImageContainerHeight =
        _maxHeight * 0.65; // 65% of constraints maxHeight
    final double _postContentContainerHeight =
        _maxHeight * 0.55; // 55% of constraints maxHeight

    return Row(
      children: <Widget>[
        Container(
          width: _parentContainerWidth,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0.0,
                height: _postImageContainerHeight,
                width: _parentContainerWidth,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/images/temp$postIndex.jpg')),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              Positioned(
                bottom: 0.0,
                height: _postContentContainerHeight,
                width: _parentContainerWidth,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, right: 10.0, left: 10.0, bottom: 10.0),
                  child: Card(
                    elevation: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/temp2.jpg'),
                              ),
                              title: Text('by John Doe'),
                              subtitle: Text('Wednessday 22, May 2019'),
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
                          SizedBox(height: 5.0),
                          Expanded(
                            child: ListTile(
                              title: Text('Affordable Wears $postIndex',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dolor purus, isaculis ac dolor nec, laoreet imperdiet eros.',
                                  overflow: TextOverflow.ellipsis),
                              trailing: IconButton(
                                tooltip: 'Save this post',
                                icon: Icon(
                                  Icons.bookmark,
                                  color: Theme.of(context).accentColor,
                                ),
                                onPressed: () {
                                  print('post saved');
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.0)
      ],
    );
  }
}
