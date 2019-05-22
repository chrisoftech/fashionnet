import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        elevation: 7.0,
        highlightElevation: 10.0,
        child: Icon(Icons.add_a_photo, size: 32.0, color: Colors.white),
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
            SuggestedPosts()
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
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30.0,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {},
      ),
      title: Text(
        'FashionNet',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35.0,
            foreground: new Paint()..shader = linearGradient),
      ),
      actions: <Widget>[
        _buildAppbarActionWidgets(context: context, icon: Icons.search),
        _buildAppbarActionWidgets(context: context, icon: Icons.person_outline),
        _buildAppbarActionWidgets(context: context, icon: Icons.more_vert),
      ],
    );
  }

  InkWell _buildAppbarActionWidgets(
      {@required BuildContext context, @required IconData icon}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          size: 30.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
