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

  final Duration _animationDuration = Duration(milliseconds: 300);
  final Duration _delay = Duration(milliseconds: 300);

  GlobalKey _rectGetterFABKey = RectGetter.createGlobalKey();
  GlobalKey _rectGetterSearchKey = RectGetter.createGlobalKey();

  Rect _rect;

  void _onFABTap() async {
    setState(() => _rect = RectGetter.getRectFromKey(_rectGetterFABKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          _rect = _rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(_animationDuration + _delay, _navigateToPostFormPage);
    });
  }

  void _navigateToPostFormPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: PostFormPage()))
        .then((_) => setState(() => _rect = null));
  }

  void _onSearchTap() async {
    setState(() => _rect = RectGetter.getRectFromKey(_rectGetterSearchKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          _rect = _rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(_animationDuration + _delay, _navigateToSearchPage);
    });
  }

  void _navigateToSearchPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: SearchForm()))
        .then((_) => setState(() => _rect = null));
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        _buildScaffold(context, _deviceHeight, _deviceWidth),
        Ripple(animationDuration: _animationDuration, rect: _rect)
      ],
    );
  }

  Scaffold _buildScaffold(
      BuildContext context, double _deviceHeight, double _deviceWidth) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: RectGetter(
        key: _rectGetterFABKey,
        child: _buildFloatingActionButton(context),
      ),
      bottomNavigationBar: BottomNavBar(
        onActiveIndexChange: (int index) {
          print(index);
        },
      ),
      body: _buildPageBody(_deviceHeight, _deviceWidth),
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.orange, Colors.indigo],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 250.0, 70.0));

  Widget _buildAppbarActionWidgets(
      {@required BuildContext context,
      @required int index,
      @required IconData icon}) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          _onSearchTap();
        }
      },
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
        RectGetter(
          key: _rectGetterSearchKey,
          child: _buildAppbarActionWidgets(
              context: context, index: 0, icon: Icons.search),
        ),
        _buildAppbarActionWidgets(
            context: context, index: 1, icon: Icons.person_outline),
        _buildAppbarActionWidgets(
            context: context, index: 2, icon: Icons.more_vert),
      ],
    );
  }

  Container _buildPageBody(double _deviceHeight, double _deviceWidth) {
    return Container(
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
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 7.0,
      highlightElevation: 10.0,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add_a_photo, size: 32.0, color: Colors.white),
      onPressed: _onFABTap,
    );
  }
}
