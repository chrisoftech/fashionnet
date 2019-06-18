// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fashion_connect/models/models.dart';
import 'package:fashionnet/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:intl/intl.dart';

class PostItemCardDefault extends StatefulWidget {
  final List<String> postImages;

  const PostItemCardDefault({Key key, @required this.postImages})
      : super(key: key);
  @override
  _PostItemCardDefaultState createState() => _PostItemCardDefaultState();
}

class _PostItemCardDefaultState extends State<PostItemCardDefault> {
  int _currentPostImageIndex = 0;

  List<String> get _postImages => widget.postImages;

  @override
  Widget build(BuildContext context) {
    return _buildPostItem();
  }

  Widget _buildPostItem() {
    final _deviceWidth = MediaQuery.of(context).size.width;
    final _contentWidth = _deviceWidth > 450.0 ? 450.0 : _deviceWidth;

    return Column(
      children: <Widget>[
        Card(
          elevation: 8.0,
          child: InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed('/post-details');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PostDetailsPage(
                            postImages: _postImages,
                          )));
            },
            child: Container(
              width: _contentWidth,
              child: Column(
                children: <Widget>[
                  _buildPostDetails(),
                  _buildPostCardBackgroundImage()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0)
      ],
    );
  }

  Widget _buildActivePostImage() {
    return Container(
      width: 9.0,
      height: 9.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(width: 2.0, color: Theme.of(context).accentColor),
      ),
    );
  }

  Widget _buildInactivePostImage() {
    return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color.fromRGBO(0, 0, 0, 0.4)));
  }

  Widget _buildPostImageCarouselIndicator() {
    List<Widget> dots = [];

    for (int i = 0; i < _postImages.length; i++) {
      dots.add(i == _currentPostImageIndex
          ? _buildActivePostImage()
          : _buildInactivePostImage());
    }

    return Positioned(
        left: 0.0,
        right: 0.0,
        bottom: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots,
        ));
  }

  Widget _buildPostImageCarousel() {
    return CarouselSlider(
        height: 400.0,
        viewportFraction: _postImages.length > 1 ? 0.8 : 1.0,
        enableInfiniteScroll: false,
        // enlargeCenterPage: true,
        onPageChanged: (int index) {
          setState(() {
            _currentPostImageIndex = index;
          });
        },
        items: _postImages.map((postImageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset('assets/images/temp$postImageUrl.jpg',
                  fit: BoxFit.cover);

              //return CachedNetworkImage(
              //   fit: BoxFit.cover,
              //   imageUrl: 'assets/images/temp$postImageUrl',
              //   placeholder: (context, url) =>
              //       Center(child: new CircularProgressIndicator()),
              //   errorWidget: (context, url, error) =>
              //       Center(child: new Icon(Icons.error)),
              // );
            },
          );
        }).toList());
  }

  Widget _buildPostCardBackgroundImage() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: _postImages.length > 0
              ? _buildPostImageCarousel()
              : Image.asset('assets/avatars/bg-avatar.png', fit: BoxFit.cover),
        ),
        _postImages.length > 1
            ? _buildPostImageCarouselIndicator()
            : Container(),
      ],
    );
  }

  Widget _buildPostDetails() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Container(
            height: 50.0,
            width: 50.0,
            child: _postImages.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset('assets/images/temp2.jpg',
                        fit: BoxFit.cover)

                    // CachedNetworkImage(
                    //   fit: BoxFit.cover,
                    //   imageUrl: '${_postUser.userProfile.imageUrl}',
                    //   placeholder: (context, url) =>
                    //       new CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) =>
                    //       new Icon(Icons.error),
                    // ),
                    )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset('assets/avatars/ps-avatar.png',
                        fit: BoxFit.cover),
                  ),
          ),
          title: Text('John Doe'),
          subtitle: Text('Sunday May 26, 2019'),
          // '${DateFormat.yMMMMEEEEd().format(_postUser.post.lastUpdate)}'),
          trailing: IconButton(
            onPressed: () {
              print('isFavorite');
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
        ),
        ListTile(
          title: Text('Affordable Wears'),
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
      ],
    );
  }
}
