import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileFormWizardPage extends StatefulWidget {
  @override
  _ProfileFormWizardPageState createState() => _ProfileFormWizardPageState();
}

class _ProfileFormWizardPageState extends State<ProfileFormWizardPage> {
  final _pageController = PageController(initialPage: 0, keepPage: true);
  PageView _pageView;

  int _currentWizardPageIndex = 0;

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  void _jumpToPreviousPage() {
    if (_currentWizardPageIndex == 0) {
      Navigator.of(context).pop();
    } else {
      _pageController.jumpToPage(--_currentWizardPageIndex);
    }
  }

  void _jumpToNextPage() {
    if (_currentWizardPageIndex == 4) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      _pageController.jumpToPage(++_currentWizardPageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageView = PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int index) {
        setState(() {
          _currentWizardPageIndex = index;
        });
      },
      children: <Widget>[
        ProfileImageForm(),
        ProfileBioForm(),
        ProfileBusinessForm(),
        ProfileContactForm(),
        ProfileLocationForm(),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          _pageView,
          _buildFormWizardIndicator(),
          _buildFormWizardActions()
        ],
      ),
    );
  }

  Widget _buildActiveWizardPage() {
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

  Widget _buildInactiveWizardPage() {
    return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color.fromRGBO(0, 0, 0, 0.4)));
  }

  Widget _buildFormWizardIndicator() {
    List<Widget> dots = [];

    for (int i = 0; i < 5; i++) {
      dots.add(i == _currentWizardPageIndex
          ? _buildActiveWizardPage()
          : _buildInactiveWizardPage());
    }

    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 20.0,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dots,
      ),
    );
  }

  Widget _buildFormWizardActions() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      height: 80.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black54,
              ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              splashColor: Colors.white30,
              child: Text(
                _currentWizardPageIndex == 0 ? 'Logout' : 'Previous',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20.0),
              ),
              onPressed: _jumpToPreviousPage,
            ),
            FlatButton(
              splashColor: Colors.white30,
              child: Text(
                _currentWizardPageIndex == 4 ? 'Complete' : 'Continue',
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20.0),
              ),
              onPressed: _jumpToNextPage,
            ),
          ],
        ),
      ),
    );
  }
}
