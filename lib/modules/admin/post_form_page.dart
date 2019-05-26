import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: _buildBody(
            context: context,
            deviceHeight: _deviceHeight,
            deviceWidth: _deviceWidth),
      ),
    );
  }

  Widget _buildBody(
      {@required BuildContext context,
      @required double deviceHeight,
      @required double deviceWidth}) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      child: Stack(
        children: <Widget>[
          PostFormCarousel(
              deviceHeight: deviceHeight, deviceWidth: deviceWidth),
          _buildAppBar(context: context, deviceHeight: deviceHeight),
          _buildActionBarStack(
              deviceHeight: deviceHeight, deviceWidth: deviceWidth),
          PostFormCard(
              context: context,
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth),
          _buildActionFAB(context: context)
        ],
      ),
    );
  }

  Widget _buildActionFAB({@required BuildContext context}) {
    return Positioned(
      top: 175.0,
      right: 10.0,
      child: ButtonBar(
        children: <Widget>[
          FloatingActionButton(
            elevation: 8.0,
            highlightElevation: 10.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.save,
              color: Colors.white,
              size: 32.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Positioned _buildAppBar(
      {@required BuildContext context, @required double deviceHeight}) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      height: 100.0,
      width: deviceHeight,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Widget _buildActionBarStack(
      {@required double deviceHeight, @required double deviceWidth}) {
    return Stack(
      children: <Widget>[
        _buildSelectImageControl(deviceWidth: deviceWidth),
        _buildCarouselIndicator(deviceWidth: deviceWidth),
      ],
    );
  }

  Positioned _buildSelectImageControl({@required double deviceWidth}) {
    return Positioned(
      top: 135.0,
      height: 100.0,
      width: deviceWidth,
      child: Column(
        children: <Widget>[
          Material(
            elevation: 8.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator({@required double deviceWidth}) {
    Widget _carouselIndicatorItem = Row(
      children: <Widget>[
        Container(
          height: 5.0,
          width: 25.0,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        SizedBox(width: 5.0)
      ],
    );

    return Positioned(
      top: 190.0,
      height: 50.0,
      width: deviceWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _carouselIndicatorItem,
          _carouselIndicatorItem,
          _carouselIndicatorItem,
        ],
      ),
    );
  }
}
