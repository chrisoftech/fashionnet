import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

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
