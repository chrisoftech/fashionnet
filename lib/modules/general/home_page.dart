import 'package:fashionnet/modules/modules.dart';
import 'package:fashionnet/utilities/utilities.dart';
import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rect_getter/rect_getter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Color get _accentColor => Theme.of(context).accentColor;
  Color get _primaryColor => Theme.of(context).primaryColor;

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);

  GlobalKey _rectGetterKey = RectGetter.createGlobalKey(); //<--Create a key
  Rect _rect; //<--Declare field of rect

  void _onFABTap() async {
    setState(() => _rect = RectGetter.getRectFromKey(
        _rectGetterKey)); //<-- set _rect to be size of fab
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //<-- on the next frame...
      setState(() => _rect = _rect.inflate(1.3 *
          MediaQuery.of(context).size.longestSide)); //<-- set rect to be big
      Future.delayed(animationDuration + delay,
          _navigateToPostFormPage); //<-- after delay, go to next page
    });
  }

  void _navigateToPostFormPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: PostFormPage()))
        .then((_) => setState(() => _rect = null));
  }

  Widget _buildRipple() {
    if (_rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      //<--replace Positioned with AnimatedPositioned
      duration: animationDuration, //<--specify the animation duration
      left: _rect.left,
      right: MediaQuery.of(context).size.width - _rect.right,
      top: _rect.top,
      bottom: MediaQuery.of(context).size.height - _rect.bottom,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        _buildScaffold(context, _deviceHeight, _deviceWidth),
        _buildRipple()
      ],
    );
  }

  Scaffold _buildScaffold(
      BuildContext context, double _deviceHeight, double _deviceWidth) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: RectGetter(
        key: _rectGetterKey,
        child: FloatingActionButton(
          elevation: 7.0,
          highlightElevation: 10.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add_a_photo, size: 32.0, color: Colors.white),
          onPressed: _onFABTap,
        ),
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
          color: _primaryColor,
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
          color: _primaryColor,
        ),
      ),
    );
  }
}
