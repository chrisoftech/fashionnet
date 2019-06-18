import 'package:fashionnet/modules/modules.dart';
import 'package:fashionnet/utilities/utilities.dart';
import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Color get _accentColor => Theme.of(context).accentColor;
  Color get _primaryColor => Theme.of(context).primaryColor;

  int _activePageIndex = 0;
  final _pageController = PageController(initialPage: 0, keepPage: false);
  PageView _pageView;

  bool _isExpandedSuggestedPostsMode = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    _pageView = PageView(
      controller: _pageController,
      onPageChanged: (int index) {
        print('page changed to $index');
        setState(() => _activePageIndex = index);
      },
      children: <Widget>[
        _buildPageBody(_deviceHeight, _deviceWidth),
        FeedPage(),
        BookmarkPage(),
      ],
    );

    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: BottomNavBar(
        activeIndex: _activePageIndex,
        onActiveIndexChange: (int index) {
          setState(() => _pageController.jumpToPage(index));
        },
      ),
      body: _pageView,
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
          Navigator.of(context).pushNamed('/search');
        } else if (index == 1) {
          Navigator.of(context).pushNamed('/profile');
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
            fontSize: 30.0,
            foreground: new Paint()..shader = linearGradient),
      ),
      actions: <Widget>[
        _buildAppbarActionWidgets(
            context: context, index: 0, icon: Icons.search),
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
          _isExpandedSuggestedPostsMode ? Container() : LatestPosts(),
          SuggestedPosts(
            isExpandedMode: _isExpandedSuggestedPostsMode,
            onExpandSuggestedPostsToggle: (bool isExpanded) {
              setState(() {
                _isExpandedSuggestedPostsMode = isExpanded;
              });
            },
          )
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
      onPressed: () => Navigator.of(context).pushNamed('/post-form'),
    );
  }
}
