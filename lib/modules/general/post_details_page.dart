import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  final List<String> postImages;

  const PostDetailsPage({Key key, @required this.postImages}) : super(key: key);

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  int _currentPostImageIndex = 0;

  List<String> get _postImages => widget.postImages;

  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.phone,
            size: 30.0,
            color: Colors.white70,
          ),
          onPressed: () {},
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                title: Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20.0),
                ),
                expandedHeight: _deviceHeight - 100.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: _buildPostCardBackgroundImage(),
                ),
                actions: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 30.0,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 30.0,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    child: Column(
                      children: <Widget>[
                        _buildPostDetails(),
                      ],
                    ),
                  )
                ]),
              )
              // SliverToBoxAdapter(child: Container(child: ListView(children: <Widget>[],),),)
            ],
          ),
        ));
  }

  Widget _buildActivePostImage() {
    return Container(
      width: 8.0,
      height: 8.0,
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
    final double _deviceHeight = MediaQuery.of(context).size.height;

    return CarouselSlider(
        height: _deviceHeight,
        viewportFraction: 1.0,
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
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    final double _contentHeight = _deviceHeight * 0.7;

    final double _contentWidthPadding =
        _deviceWidth > 450.0 ? _deviceWidth - 450.0 : 30.0;

    return Material(
      elevation: 5.0,
      child: Container(
        height: _contentHeight,
        // color: Colors.teal,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: _contentWidthPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ella\'s Fashion Decore',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Straight Black Dress',
                      style: TextStyle(
                          // color: Theme.of(context).accentColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900),
                    ),
                    Text('500 Likes',
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold)),
                    // SizedBox(height: 10.0),
                    SizedBox(height: 20.0),
                    Text(
                      'Colors',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.color_lens, size: 15.0),
                        SizedBox(width: 5.0),
                        Expanded(child: Text('Blue, Black, Grey')),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Contacts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time, size: 15.0),
                        SizedBox(width: 5.0),
                        Expanded(child: Text('Mon - Fri (9.00am - 6.00pm)')),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.phone_android, size: 15.0),
                        Text('+233 271245698, '),
                        Text('+233 271245698'),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 15.0),
                        Expanded(
                            child: Text(
                                'Afienya Leadership & Skills Training Institute, Afienya')),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Detail Summary',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Divider(),
                    // SizedBox(height: 10.0),
                    Text(
                      'Nulla consequat laboris irure et do exercitation. Id velit aute officia in consectetur adipisicing elit exercitation sint ea sit nulla eu eu. Officia ipsum aliquip culpa est aute duis nulla nostrud incididunt sit cillum qui ex. Mollit et eiusmod fugiat amet voluptate esse anim non commodo et adipisicing proident non. Veniam do in commodo quis elit dolore voluptate non aliqua in sunt. Irure irure aliquip eu dolor pariatur id irure occaecat proident do dolor ea sunt. Do est culpa duis eiusmod culpa mollit.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20.0),
                    // Text(
                    //   'Similar posts',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, fontSize: 18.0),
                    // ),

                    // SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
