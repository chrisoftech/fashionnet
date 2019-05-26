import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    final double _postContainerWidth =
        _deviceWidth > 450.0 ? 450.0 : _deviceWidth;

    final double _postContainerPaddingValue =
        (_deviceWidth > _postContainerWidth)
            ? (_deviceWidth - _postContainerWidth)
            : 0.0;

            final List<String> _postImages = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        highlightElevation: 10.0,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add_a_photo,
          size: 32.0,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text('John Doe'),
            // centerTitle: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildFlexibleSpace(
                  context: context,
                  deviceHeight: _deviceHeight,
                  deviceWidth: _deviceWidth),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return PostItemCardDefault(postImages: _postImages,);
            }, childCount: 10),
          ),
        ],
      ),
    );
  }


  Widget _buildFlexibleSpace(
      {@required BuildContext context,
      @required double deviceHeight,
      @required double deviceWidth}) {
    return Container(
      height: 230.0,
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 70.0),
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                border: Border.all(
                    width: 2.0, color: Theme.of(context).accentColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset('assets/images/temp3.jpg', fit: BoxFit.cover),
            ),
          ),
          Text(
            'John Doe',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          Material(
            elevation: 10.0,
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              splashColor: Colors.black38,
              onTap: () {},
              child: Container(
                // alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Subscribe',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      height: 15.0,
                      width: 1.0,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '10k followers',
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      shape: BoxShape.circle),
                  child: IconButton(
                    tooltip: 'Call John Doe',
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      shape: BoxShape.circle),
                  child: IconButton(
                    tooltip: 'Chat with John Doe',
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
