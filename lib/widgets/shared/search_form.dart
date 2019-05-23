import 'package:fashionnet/modules/modules.dart';
import 'package:fashionnet/utilities/utilities.dart';
import 'package:fashionnet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _deviceheight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _parentContentWidth =
        _deviceWidth * 0.90; // 90% of device width

    final double _parentContentPadding = (_deviceWidth * 0.10) /
        2; // 10% of device width divided by 2 to pad both sides

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        appBar: _buildAppBar(parentContentWidth: _parentContentWidth),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Close search',
          elevation: 8.0,
          highlightElevation: 10.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.close,
            size: 32.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushReplacement(
              context, FadeRouteBuilder(page: HomePage())),
          // FadeInAndOutRouteBuilder(enterPage: HomePage(), exitPage: this)),
        ),
        body: _buildSearchBody(
            _deviceheight, _deviceWidth, _parentContentPadding),
      ),
    );
  }

  AppBar _buildAppBar({@required double parentContentWidth}) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildSearchTextField(parentContentWidth: parentContentWidth),
          ],
        ),
      ),
    );
  }

  Card _buildSearchTextField({@required double parentContentWidth}) {
    return Card(
      elevation: 5.0,
      child: Container(
        height: 50.0,
        width: parentContentWidth,
        child: TextFormField(
          style: TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: 'Search posts',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, size: 30.0),
            suffixIcon: Icon(Icons.mic, size: 30.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBody(
      double _deviceheight, double _deviceWidth, double _parentContentPadding) {
    return Container(
      height: _deviceheight,
      width: _deviceWidth,
      child: Column(
        children: <Widget>[
          Flexible(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _parentContentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '50 records found',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return PostItemCardSmall(
                              constraints: constraints, postIndex: index);
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
