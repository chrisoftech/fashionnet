import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search, size: 32.0, color: Colors.white),
        onPressed: () {
          print('FAB Clicked');
        },
      ),
      bottomNavigationBar: BottomNavBar(
        onActiveIndexChange: (int index) {
          print(index);
        },
      ),
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            CategoryNavBar(
              onActiveCategoryChange: (String categoryId) {
                print(categoryId);
              },
            ),
            SizedBox(height: 10.0),
            LatestPosts(),
            Flexible(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.orange, Colors.indigo],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 250.0, 70.0));

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 32.0,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
          Text(
            'FashionNet',
            style: TextStyle(
                // color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                foreground: new Paint()..shader = linearGradient),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 32.0,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
